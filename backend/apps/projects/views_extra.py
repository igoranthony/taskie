"""Recursos do desktop (zntt-control/znttaskie): tags, modelos de projeto,
lixeira e métricas. Tudo filtrado pelo que o usuário enxerga (access.py)."""
from datetime import timedelta

from django.db import transaction
from django.db.models import Count, Q
from django.shortcuts import get_object_or_404
from django.utils import timezone
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from apps.tasks.enums import ActivityType
from apps.tasks.models import Task, TimeEntry

from .access import projetos_visiveis
from .models import Project, ProjectTemplate, Tag
from .serializers import ProjectTemplateSerializer, TagSerializer


def _tag_json(tag):
    return {'id': str(tag.id), 'nome': tag.nome, 'cor': tag.cor}


# ── Tags ─────────────────────────────────────────────────────────────────────

class TagViewSet(viewsets.ModelViewSet):
    """Tags do usuário, com quantas tasks/projetos usam cada uma."""

    serializer_class = TagSerializer
    permission_classes = [IsAuthenticated]
    pagination_class = None

    def get_queryset(self):
        return Tag.objects.filter(criado_por=self.request.user).annotate(
            task_count=Count('tasks', filter=Q(tasks__deletado_em__isnull=True), distinct=True),
            project_count=Count('projects', filter=Q(projects__deletado_em__isnull=True), distinct=True),
        ).order_by('nome')

    def perform_create(self, serializer):
        serializer.save(criado_por=self.request.user)


# ── Modelos de projeto ───────────────────────────────────────────────────────

class ProjectTemplateViewSet(viewsets.ModelViewSet):
    """GET/PATCH(nome)/DELETE /templates/ · GET /templates/{id}/conteudo/ ·
    POST /templates/do-projeto/ { projeto, nome }"""

    serializer_class = ProjectTemplateSerializer
    permission_classes = [IsAuthenticated]
    pagination_class = None
    http_method_names = ['get', 'post', 'patch', 'delete', 'head', 'options']

    def get_queryset(self):
        return ProjectTemplate.objects.filter(criado_por=self.request.user).prefetch_related('tags')

    def create(self, request, *args, **kwargs):
        return Response({'detail': 'Use /templates/do-projeto/.'}, status=status.HTTP_405_METHOD_NOT_ALLOWED)

    @action(detail=True, methods=['get'])
    def conteudo(self, request, pk=None):
        tpl = self.get_object()
        colunas = sorted(tpl.colunas or [], key=lambda c: c.get('posicao', 0))
        return Response({'colunas': colunas, 'tags': [_tag_json(t) for t in tpl.tags.all()]})

    @action(detail=False, methods=['post'], url_path='do-projeto')
    def do_projeto(self, request):
        projeto = get_object_or_404(projetos_visiveis(request.user), pk=request.data.get('projeto'))
        serializer = self.get_serializer(data={'nome': request.data.get('nome', '')})
        serializer.is_valid(raise_exception=True)
        with transaction.atomic():
            tpl = serializer.save(
                criado_por=request.user,
                colunas=[
                    {'nome': c.nome, 'posicao': c.posicao, 'is_done_column': c.is_done_column}
                    for c in projeto.columns.order_by('posicao')
                ],
            )
            tpl.tags.set(projeto.tags.filter(criado_por=request.user))
        return Response(self.get_serializer(tpl).data, status=status.HTTP_201_CREATED)


# ── Lixeira ──────────────────────────────────────────────────────────────────

class TrashViewSet(viewsets.ViewSet):
    """Projetos e tasks arquivados (soft delete) do usuário.

    GET    /trash/                              { projetos, tasks }
    GET    /trash/contagem/                     { projetos, tasks }
    POST   /trash/projetos/{id}/restaurar/
    POST   /trash/tasks/{id}/restaurar/
    DELETE /trash/projetos/{id}/                exclui de vez
    DELETE /trash/tasks/{id}/                   exclui de vez
    DELETE /trash/esvaziar/                     exclui tudo de vez
    """

    permission_classes = [IsAuthenticated]

    def _projetos(self, request):
        # Só o dono arquiva/restaura/exclui projeto.
        return Project.all_objects.filter(criado_por=request.user, deletado_em__isnull=False)

    def _tasks(self, request):
        # Tasks arquivadas sozinhas, em projetos vivos que o usuário enxerga.
        vivos = projetos_visiveis(request.user).values('pk')
        return Task.all_objects.filter(
            deletado_em__isnull=False, projeto__in=vivos,
        ).filter(Q(criado_por=request.user) | Q(projeto__criado_por=request.user))

    def list(self, request):
        projetos = []
        for p in self._projetos(request).select_related('categoria').order_by('-deletado_em'):
            projetos.append({
                'id': str(p.id), 'nome': p.nome, 'cor': p.cor, 'status': p.status,
                'categoria_nome': p.categoria.nome if p.categoria_id else None,
                'total_tasks': Task.all_objects.filter(projeto=p).count(),
                'arquivado_em': p.deletado_em, 'criado_em': p.criado_em,
            })
        tasks = [{
            'id': str(t.id), 'titulo': t.titulo, 'prioridade': t.prioridade,
            'data_limite': t.data_limite, 'projeto': str(t.projeto_id), 'coluna': str(t.coluna_id),
            'projeto_nome': t.projeto.nome, 'projeto_cor': t.projeto.cor,
            'coluna_nome': t.coluna.nome if t.coluna_id else None,
            'arquivado_em': t.deletado_em,
        } for t in self._tasks(request).select_related('projeto', 'coluna').order_by('-deletado_em')]
        return Response({'projetos': projetos, 'tasks': tasks})

    @action(detail=False, methods=['get'])
    def contagem(self, request):
        return Response({'projetos': self._projetos(request).count(), 'tasks': self._tasks(request).count()})

    @action(detail=False, methods=['post'], url_path=r'projetos/(?P<pid>[^/.]+)/restaurar')
    def restaurar_projeto(self, request, pid=None):
        projeto = get_object_or_404(self._projetos(request), pk=pid)
        projeto.deletado_em = None
        projeto.save(update_fields=['deletado_em', 'atualizado_em'])
        return Response({'status': 'ok'})

    @action(detail=False, methods=['post'], url_path=r'tasks/(?P<tid>[^/.]+)/restaurar')
    def restaurar_task(self, request, tid=None):
        from apps.tasks import activity

        task = get_object_or_404(self._tasks(request), pk=tid)
        task.deletado_em = None
        task.save(update_fields=['deletado_em', 'atualizado_em'])
        activity.registrar(task, ActivityType.RESTORED, usuario=request.user)
        return Response({'status': 'ok'})

    @action(detail=False, methods=['delete'], url_path=r'projetos/(?P<pid>[^/.]+)')
    def excluir_projeto(self, request, pid=None):
        projeto = get_object_or_404(self._projetos(request), pk=pid)
        with transaction.atomic():
            Task.all_objects.filter(projeto=projeto).delete()  # QuerySet comum = delete real
            projeto.hard_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(detail=False, methods=['delete'], url_path=r'tasks/(?P<tid>[^/.]+)')
    def excluir_task(self, request, tid=None):
        get_object_or_404(self._tasks(request), pk=tid).hard_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(detail=False, methods=['delete'])
    def esvaziar(self, request):
        with transaction.atomic():
            projetos = list(self._projetos(request))
            Task.all_objects.filter(pk__in=self._tasks(request).values('pk')).delete()
            for p in projetos:
                Task.all_objects.filter(projeto=p).delete()
                p.hard_delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# ── Métricas ─────────────────────────────────────────────────────────────────

class MetricsViewSet(viewsets.ViewSet):
    """GET /metrics/resumo/ · /metrics/progresso/ · /metrics/carga-colunas/ ·
    /metrics/paradas/?dias=14&limite=20"""

    permission_classes = [IsAuthenticated]

    def _tasks_abertas_base(self, request):
        return Task.objects.filter(
            projeto__in=projetos_visiveis(request.user).values('pk'),
            coluna__isnull=False,
        )

    def _segundos(self, entries, desde=None):
        agora = timezone.now()
        total = 0
        for e in entries:
            inicio = max(e.inicio, desde) if desde else e.inicio
            fim = e.fim or agora
            if fim > inicio:
                total += int((fim - inicio).total_seconds())
        return total

    @action(detail=False, methods=['get'])
    def resumo(self, request):
        projetos = projetos_visiveis(request.user)
        tasks = self._tasks_abertas_base(request)
        hoje = timezone.localdate()
        entries = TimeEntry.objects.filter(task__in=tasks.values('pk')).only('inicio', 'fim')
        semana = timezone.now() - timedelta(days=7)
        return Response({
            'projects': projetos.count(),
            'projects_active': projetos.filter(status='ativo').count(),
            'tasks_open': tasks.filter(coluna__is_done_column=False).count(),
            'tasks_done': tasks.filter(coluna__is_done_column=True).count(),
            'tasks_overdue': tasks.filter(coluna__is_done_column=False, data_limite__date__lt=hoje).count(),
            'seconds_total': self._segundos(entries),
            'seconds_week': self._segundos(entries.filter(Q(fim__isnull=True) | Q(fim__gte=semana)), desde=semana),
        })

    @action(detail=False, methods=['get'])
    def progresso(self, request):
        hoje = timezone.localdate()
        linhas = []
        for p in projetos_visiveis(request.user):
            tasks = Task.objects.filter(projeto=p, coluna__isnull=False)
            linhas.append({
                'id': str(p.id), 'nome': p.nome, 'cor': p.cor, 'status': p.status,
                'total_tasks': tasks.count(),
                'done_tasks': tasks.filter(coluna__is_done_column=True).count(),
                'overdue_tasks': tasks.filter(coluna__is_done_column=False, data_limite__date__lt=hoje).count(),
                'seconds': self._segundos(TimeEntry.objects.filter(task__in=tasks.values('pk')).only('inicio', 'fim')),
            })
        linhas.sort(key=lambda r: (-r['total_tasks'], r['nome'].lower()))
        return Response(linhas)

    @action(detail=False, methods=['get'], url_path='carga-colunas')
    def carga_colunas(self, request):
        grupos = {}
        for t in self._tasks_abertas_base(request).select_related('coluna'):
            chave = t.coluna.nome.strip().lower()
            g = grupos.setdefault(chave, {'nome': t.coluna.nome, 'is_done_column': False, 'tasks': 0})
            g['tasks'] += 1
            g['is_done_column'] = g['is_done_column'] or t.coluna.is_done_column
        return Response(sorted(grupos.values(), key=lambda g: -g['tasks']))

    @action(detail=False, methods=['get'])
    def paradas(self, request):
        dias = int(request.query_params.get('dias', 14))
        limite = min(int(request.query_params.get('limite', 20)), 100)
        corte = timezone.now() - timedelta(days=dias)
        agora = timezone.now()
        tasks = (self._tasks_abertas_base(request)
                 .filter(coluna__is_done_column=False, atualizado_em__lte=corte)
                 .select_related('projeto', 'coluna').order_by('atualizado_em')[:limite])
        return Response([{
            'id': str(t.id), 'titulo': t.titulo, 'atualizado_em': t.atualizado_em,
            'projeto': str(t.projeto_id), 'projeto_nome': t.projeto.nome, 'projeto_cor': t.projeto.cor,
            'coluna_nome': t.coluna.nome, 'dias_parada': (agora - t.atualizado_em).days,
        } for t in tasks])
