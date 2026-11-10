from django.db import transaction
from django.db.models import F, Max, Q
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.exceptions import ValidationError
from rest_framework.filters import OrderingFilter
from rest_framework.parsers import FormParser, JSONParser, MultiPartParser
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from apps.core.mixins import ActionSerializerMixin
from apps.projects.access import projetos_visiveis, tasks_visiveis

from . import activity
from .enums import ActivityType
from .filters import TaskFilter
from .models import Attachment, Subtask, Task, TaskActivity, TaskHistory, TimeEntry
from .permissions import IsOwnerOrReadOnly
from .serializers import (
    AttachmentSerializer,
    SubtaskCreateSerializer,
    SubtaskSerializer,
    TaskActivitySerializer,
    TaskCreateSerializer,
    TaskHistorySerializer,
    TaskSerializer,
    TaskUpdateSerializer,
    TimeEntrySerializer,
)


def _tags_json(task):
    return [{'id': str(t.id), 'nome': t.nome, 'cor': t.cor} for t in task.tags.all()]


def _reordenar(queryset, ids):
    """Grava posicao = índice na lista, só para os ids do queryset."""
    validos = set(str(pk) for pk in queryset.values_list('pk', flat=True))
    with transaction.atomic():
        for posicao, pk in enumerate(ids):
            if str(pk) in validos:
                queryset.filter(pk=pk).update(posicao=posicao)


class TaskViewSet(ActionSerializerMixin, viewsets.ModelViewSet):
    """ViewSet completo para Tasks com CRUD, histórico, subtarefas e board."""

    serializer_class = TaskSerializer
    serializer_classes = {
        'create': TaskCreateSerializer,
        'update': TaskUpdateSerializer,
        'partial_update': TaskUpdateSerializer,
    }
    permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_class = TaskFilter
    ordering_fields = ['criado_em', 'atualizado_em', 'data_limite', 'titulo', 'posicao']
    ordering = ['-criado_em']

    def get_queryset(self):
        # Só tasks que o usuário enxerga (criou, atribuídas a ele ou de projeto
        # que ele acessa). Antes devolvia as tasks de todos os usuários.
        return tasks_visiveis(self.request.user).select_related(
            'criado_por', 'atribuido_para', 'projeto', 'coluna'
        ).prefetch_related('subtarefas', 'anexos', 'tags')

    def perform_create(self, serializer):
        projeto = serializer.validated_data.get('projeto')
        coluna = serializer.validated_data.get('coluna')
        if projeto and not projetos_visiveis(self.request.user).filter(pk=projeto.pk).exists():
            raise ValidationError({'projeto': 'Projeto não encontrado.'})
        if coluna and coluna.projeto_id != getattr(projeto, 'pk', None):
            raise ValidationError({'coluna': 'A coluna não é deste projeto.'})
        if coluna and 'posicao' not in self.request.data:
            maior = Task.objects.filter(coluna=coluna).aggregate(m=Max('posicao'))['m']
            serializer.validated_data['posicao'] = (maior if maior is not None else -1) + 1
        task = serializer.save(criado_por=self.request.user)
        activity.registrar(task, ActivityType.CREATED, novo=task.titulo, usuario=self.request.user)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(
            TaskSerializer(serializer.instance, context={'request': request}).data,
            status=status.HTTP_201_CREATED,
        )

    def perform_update(self, serializer):
        antes = activity.foto(serializer.instance)
        serializer.instance._history_user = self.request.user
        task = serializer.save()
        activity.registrar_mudancas(task, antes, self.request.user)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(TaskSerializer(serializer.instance, context={'request': request}).data)

    def perform_destroy(self, instance):
        instance.delete()  # soft delete → lixeira
        activity.registrar(instance, ActivityType.ARCHIVED, usuario=self.request.user)

    @action(detail=True, methods=['get'])
    def history(self, request, pk=None):
        """GET /tasks/{id}/history/ (app mobile)"""
        task = self.get_object()
        history = TaskHistory.objects.filter(task=task).select_related('changed_by').order_by('-changed_at')
        return Response(TaskHistorySerializer(history, many=True).data)

    @action(detail=True, methods=['get'], url_path='atividades')
    def atividades(self, request, pk=None):
        """GET /tasks/{id}/atividades/ — histórico detalhado do desktop."""
        task = self.get_object()
        qs = TaskActivity.objects.filter(task=task).select_related('usuario')[:200]
        return Response(TaskActivitySerializer(qs, many=True).data)

    @action(detail=False, methods=['get'])
    def my_tasks(self, request):
        tasks = self.get_queryset().filter(criado_por=request.user)
        page = self.paginate_queryset(tasks)
        if page is not None:
            return self.get_paginated_response(self.get_serializer(page, many=True).data)
        return Response(self.get_serializer(tasks, many=True).data)

    @action(detail=False, methods=['get'])
    def assigned_to_me(self, request):
        tasks = self.get_queryset().filter(atribuido_para=request.user)
        page = self.paginate_queryset(tasks)
        if page is not None:
            return self.get_paginated_response(self.get_serializer(page, many=True).data)
        return Response(self.get_serializer(tasks, many=True).data)

    @action(detail=False, methods=['get'])
    def stats(self, request):
        user_tasks = self.get_queryset().filter(criado_por=request.user)
        return Response({
            'total': user_tasks.count(),
            'backlog': user_tasks.filter(status='backlog').count(),
            'em_andamento': user_tasks.filter(status='em_andamento').count(),
            'concluido': user_tasks.filter(status='concluido').count(),
            'alta_prioridade': user_tasks.filter(prioridade='alta').count(),
            'media_prioridade': user_tasks.filter(prioridade='media').count(),
            'baixa_prioridade': user_tasks.filter(prioridade='baixa').count(),
        })

    @action(detail=False, methods=['get'], url_path='busca')
    def busca(self, request):
        """GET /tasks/busca/?q=texto — título, descrição e subtarefas, sem paginação."""
        q = (request.query_params.get('q') or '').strip()
        if not q:
            return Response([])
        limite = min(int(request.query_params.get('limite', 25)), 100)
        tasks = (
            self.get_queryset()
            .filter(projeto__isnull=False, coluna__isnull=False, projeto__deletado_em__isnull=True)
            .filter(Q(titulo__icontains=q) | Q(descricao__icontains=q) | Q(subtarefas__titulo__icontains=q))
            .distinct()
            .order_by('-atualizado_em')[:limite * 2]
        )
        resultado = []
        for t in tasks:
            sub = next((s.titulo for s in t.subtarefas.all() if q.lower() in s.titulo.lower()), None)
            resultado.append({
                'id': str(t.id), 'titulo': t.titulo, 'descricao': t.descricao,
                'prioridade': t.prioridade, 'data_limite': t.data_limite,
                'projeto': str(t.projeto_id), 'coluna': str(t.coluna_id),
                'projeto_nome': t.projeto.nome, 'projeto_cor': t.projeto.cor,
                'coluna_nome': t.coluna.nome,
                'hit_titulo': q.lower() in (t.titulo or '').lower(),
                'hit_descricao': q.lower() in (t.descricao or '').lower(),
                'hit_subtarefa': sub,
            })
        resultado.sort(key=lambda r: not r['hit_titulo'])
        return Response(resultado[:limite])

    @action(detail=False, methods=['get'], url_path='proximas')
    def proximas(self, request):
        """GET /tasks/proximas/ — tasks abertas com prazo, de todos os projetos."""
        tasks = (
            self.get_queryset()
            .filter(
                data_limite__isnull=False,
                projeto__isnull=False, projeto__deletado_em__isnull=True,
                coluna__is_done_column=False,
            )
            .exclude(projeto__status='concluido')
            .order_by('data_limite', 'posicao')
        )
        return Response([{
            'id': str(t.id), 'titulo': t.titulo, 'descricao': t.descricao,
            'prioridade': t.prioridade, 'data_limite': t.data_limite, 'posicao': t.posicao,
            'projeto': str(t.projeto_id), 'coluna': str(t.coluna_id),
            'projeto_nome': t.projeto.nome, 'projeto_cor': t.projeto.cor,
            'coluna_nome': t.coluna.nome,
            'subtarefas_total': len(t.subtarefas.all()),
            'subtarefas_concluidas': sum(1 for s in t.subtarefas.all() if s.concluida),
            'anexos_total': len(t.anexos.all()),
            'tags': _tags_json(t),
            'criado_em': t.criado_em,
        } for t in tasks])

    @action(detail=True, methods=['get', 'put'], url_path='tags')
    def tags(self, request, pk=None):
        """GET/PUT /tasks/{id}/tags/ — PUT { "ids": [...] } troca a seleção.
        Só aceita tags oferecidas pelo projeto da task."""
        task = self.get_object()
        if request.method == 'GET':
            return Response(_tags_json(task))

        ids = [str(i) for i in request.data.get('ids', [])]
        permitidas = task.projeto.tags.all() if task.projeto_id else request.user.tags.all()
        novas = list(permitidas.filter(pk__in=ids))
        antes = ', '.join(sorted(t.nome for t in task.tags.all())) or None
        task.tags.set(novas)
        depois = ', '.join(sorted(t.nome for t in novas)) or None
        if antes != depois:
            activity.registrar(task, ActivityType.TAGS_CHANGED, antigo=antes, novo=depois,
                               usuario=request.user)
        return Response(_tags_json(task))

    @action(detail=True, methods=['put'], url_path='subtarefas/reordenar')
    def reordenar_subtarefas(self, request, pk=None):
        """PUT /tasks/{id}/subtarefas/reordenar/ { "ids": [...] }"""
        task = self.get_object()
        _reordenar(task.subtarefas.all(), request.data.get('ids', []))
        return Response({'status': 'ok'})

    @action(detail=True, methods=['put'], url_path='anexos/reordenar')
    def reordenar_anexos(self, request, pk=None):
        """PUT /tasks/{id}/anexos/reordenar/ { "ids": [...] }"""
        task = self.get_object()
        _reordenar(task.anexos.all(), request.data.get('ids', []))
        return Response({'status': 'ok'})

    @action(detail=True, methods=['post'], url_path='move')
    def move(self, request, pk=None):
        """Move task para outra coluna com reordenação de posições.
        Body: { "coluna_id": "uuid", "posicao": 2 }
        """
        task = self.get_object()
        nova_coluna_id = request.data.get('coluna_id')
        nova_posicao = int(request.data.get('posicao', 0))

        if not nova_coluna_id:
            return Response({'detail': 'coluna_id é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)

        from apps.projects.models import Column
        try:
            nova_coluna = Column.objects.get(pk=nova_coluna_id, projeto__in=projetos_visiveis(request.user))
        except Column.DoesNotExist:
            return Response({'detail': 'Coluna não encontrada.'}, status=status.HTTP_404_NOT_FOUND)

        with transaction.atomic():
            old_coluna = task.coluna

            if old_coluna:
                Task.objects.filter(
                    coluna_id=old_coluna.pk,
                    posicao__gt=task.posicao,
                    deletado_em__isnull=True,
                ).update(posicao=F('posicao') - 1)

            Task.objects.filter(
                coluna_id=nova_coluna_id,
                posicao__gte=nova_posicao,
                deletado_em__isnull=True,
            ).exclude(pk=task.pk).update(posicao=F('posicao') + 1)

            task.coluna = nova_coluna
            task.posicao = nova_posicao
            task.status = 'concluido' if nova_coluna.is_done_column else 'em_andamento'
            task.save(update_fields=['coluna', 'posicao', 'status', 'atualizado_em'])

            if old_coluna is None or old_coluna.pk != nova_coluna.pk:
                activity.registrar(
                    task, ActivityType.MOVED, 'coluna',
                    old_coluna.nome if old_coluna else None, nova_coluna.nome, request.user,
                )

        return Response(TaskSerializer(task, context={'request': request}).data)


class SubtaskViewSet(ActionSerializerMixin, viewsets.ModelViewSet):
    serializer_class = SubtaskSerializer
    serializer_classes = {'create': SubtaskCreateSerializer}
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Subtask.objects.filter(
            task__in=tasks_visiveis(self.request.user).values('pk')
        ).select_related('task')

    def create(self, request, *args, **kwargs):
        serializer = SubtaskCreateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        task = serializer.validated_data['task']
        if not tasks_visiveis(request.user).filter(pk=task.pk).exists():
            return Response({'detail': 'Task não encontrada.'}, status=status.HTTP_404_NOT_FOUND)
        if 'posicao' not in request.data:
            maior = task.subtarefas.aggregate(m=Max('posicao'))['m']
            serializer.validated_data['posicao'] = (maior if maior is not None else -1) + 1
        subtask = serializer.save()
        activity.registrar(task, ActivityType.SUBTASK_ADDED, novo=subtask.titulo, usuario=request.user)
        return Response(SubtaskSerializer(subtask).data, status=status.HTTP_201_CREATED)

    def perform_destroy(self, instance):
        activity.registrar(instance.task, ActivityType.SUBTASK_REMOVED, antigo=instance.titulo,
                           usuario=self.request.user)
        instance.delete()

    @action(detail=True, methods=['post'], url_path='toggle')
    def toggle(self, request, pk=None):
        subtask = self.get_object()
        subtask.concluida = not subtask.concluida
        subtask.save(update_fields=['concluida'])
        # Mesmo formato do desktop: estado em valor_novo, título em valor_antigo.
        activity.registrar(
            subtask.task, ActivityType.SUBTASK_TOGGLED,
            antigo=subtask.titulo, novo='done' if subtask.concluida else 'open', usuario=request.user,
        )
        return Response(SubtaskSerializer(subtask).data)


class AttachmentViewSet(viewsets.ModelViewSet):
    serializer_class = AttachmentSerializer
    permission_classes = [IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser, JSONParser]

    def get_queryset(self):
        return Attachment.objects.filter(
            task__in=tasks_visiveis(self.request.user).values('pk')
        ).select_related('task')

    def create(self, request, *args, **kwargs):
        """Upload de anexo. Body: multipart/form-data com campos 'task' e 'arquivo'."""
        arquivo = request.FILES.get('arquivo')
        task_id = request.data.get('task')

        if not arquivo:
            return Response({'detail': 'Arquivo é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)
        if not task_id:
            return Response({'detail': 'task é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)
        task = get_object_or_404(tasks_visiveis(request.user), pk=task_id)

        maior = task.anexos.aggregate(m=Max('posicao'))['m']
        attachment = Attachment.objects.create(
            task=task,
            arquivo=arquivo,
            nome_original=arquivo.name,
            mime_type=arquivo.content_type,
            tamanho_bytes=arquivo.size,
            posicao=(maior if maior is not None else -1) + 1,
        )
        activity.registrar(task, ActivityType.ATTACHMENT_ADDED, novo=arquivo.name, usuario=request.user)
        return Response(
            AttachmentSerializer(attachment, context={'request': request}).data,
            status=status.HTTP_201_CREATED,
        )

    def perform_destroy(self, instance):
        activity.registrar(instance.task, ActivityType.ATTACHMENT_REMOVED,
                           antigo=instance.nome_original, usuario=self.request.user)
        instance.arquivo.delete(save=False)
        instance.delete()


class TimeEntryViewSet(viewsets.ModelViewSet):
    """Time tracking. O timer rodando é por usuário: iniciar um para o anterior.

    GET    /time-entries/?task=<id>        lançamentos da task
    POST   /time-entries/                  lançamento manual {task, inicio, fim, nota}
    PATCH  /time-entries/{id}/             {inicio, fim}
    DELETE /time-entries/{id}/
    GET    /time-entries/rodando/          timer do usuário (ou null)
    POST   /time-entries/iniciar/          {task}
    POST   /time-entries/{id}/parar/
    GET    /time-entries/totais/?tasks=a,b {task_id: segundos}
    """

    serializer_class = TimeEntrySerializer
    permission_classes = [IsAuthenticated]
    pagination_class = None

    def get_queryset(self):
        qs = TimeEntry.objects.filter(
            task__in=tasks_visiveis(self.request.user).values('pk')
        ).select_related('task', 'task__projeto')
        task = self.request.query_params.get('task')
        if task and self.action == 'list':
            qs = qs.filter(task_id=task)
        return qs

    def _task(self, task_id):
        return get_object_or_404(tasks_visiveis(self.request.user), pk=task_id)

    def perform_create(self, serializer):
        task = self._task(self.request.data.get('task'))
        if not serializer.validated_data.get('fim'):
            raise ValidationError({'fim': 'Informe o início e o fim.'})
        entry = serializer.save(usuario=self.request.user, task=task)
        activity.registrar(task, ActivityType.TIME_LOGGED,
                           novo=f'{entry.inicio.isoformat()} → {entry.fim.isoformat()}',
                           usuario=self.request.user)

    def perform_update(self, serializer):
        if serializer.instance.usuario_id != self.request.user.pk:
            raise ValidationError({'detail': 'Só quem lançou pode alterar.'})
        serializer.save()

    def perform_destroy(self, instance):
        if instance.usuario_id != self.request.user.pk:
            raise ValidationError({'detail': 'Só quem lançou pode excluir.'})
        instance.delete()

    def _rodando_json(self, entry):
        if not entry:
            return None
        data = TimeEntrySerializer(entry).data
        data.update({
            'task_titulo': entry.task.titulo,
            'projeto': str(entry.task.projeto_id) if entry.task.projeto_id else None,
            'projeto_nome': entry.task.projeto.nome if entry.task.projeto_id else None,
        })
        return data

    @action(detail=False, methods=['get'])
    def rodando(self, request):
        entry = (TimeEntry.objects.filter(usuario=request.user, fim__isnull=True)
                 .select_related('task', 'task__projeto').order_by('-inicio').first())
        return Response(self._rodando_json(entry))

    @action(detail=False, methods=['post'])
    def iniciar(self, request):
        task = self._task(request.data.get('task'))
        agora = timezone.now()
        with transaction.atomic():
            TimeEntry.objects.filter(usuario=request.user, fim__isnull=True).update(fim=agora)
            entry = TimeEntry.objects.create(task=task, usuario=request.user, inicio=agora)
        return Response(TimeEntrySerializer(entry).data, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=['post'])
    def parar(self, request, pk=None):
        entry = get_object_or_404(TimeEntry, pk=pk, usuario=request.user)
        if entry.fim is None:
            entry.fim = timezone.now()
            entry.save(update_fields=['fim', 'atualizado_em'])
            activity.registrar(entry.task, ActivityType.TIME_LOGGED,
                               novo=f'{entry.inicio.isoformat()} → {entry.fim.isoformat()}',
                               usuario=request.user)
        return Response(TimeEntrySerializer(entry).data)

    @action(detail=False, methods=['get'])
    def totais(self, request):
        ids = [i for i in (request.query_params.get('tasks') or '').split(',') if i]
        if not ids:
            return Response({})
        agora = timezone.now()
        totais = {}
        for e in self.get_queryset().filter(task_id__in=ids).only('task_id', 'inicio', 'fim'):
            chave = str(e.task_id)
            totais[chave] = totais.get(chave, 0) + e.segundos(agora)
        return Response(totais)
