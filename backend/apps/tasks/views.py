from django.db import transaction
from django.db.models import F
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.filters import OrderingFilter
from rest_framework.parsers import FormParser, JSONParser, MultiPartParser
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from apps.core.mixins import ActionSerializerMixin

from .filters import TaskFilter
from .models import Attachment, Subtask, Task, TaskHistory
from .permissions import IsOwnerOrReadOnly
from .serializers import (
    AttachmentSerializer,
    SubtaskCreateSerializer,
    SubtaskSerializer,
    TaskCreateSerializer,
    TaskHistorySerializer,
    TaskSerializer,
    TaskUpdateSerializer,
)


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
        return Task.objects.select_related(
            'criado_por', 'atribuido_para', 'projeto', 'coluna'
        ).prefetch_related('subtarefas', 'anexos').all()

    def perform_create(self, serializer):
        serializer.save(criado_por=self.request.user)

    def perform_update(self, serializer):
        serializer.instance._history_user = self.request.user
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()

    @action(detail=True, methods=['get'])
    def history(self, request, pk=None):
        """GET /tasks/{id}/history/"""
        task = self.get_object()
        history = TaskHistory.objects.filter(task=task).select_related('changed_by').order_by('-changed_at')
        return Response(TaskHistorySerializer(history, many=True).data)

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
            nova_coluna = Column.objects.get(pk=nova_coluna_id)
        except Column.DoesNotExist:
            return Response({'detail': 'Coluna não encontrada.'}, status=status.HTTP_404_NOT_FOUND)

        with transaction.atomic():
            old_coluna_id = task.coluna_id

            if old_coluna_id:
                Task.objects.filter(
                    coluna_id=old_coluna_id,
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

        return Response(TaskSerializer(task, context={'request': request}).data)


class SubtaskViewSet(ActionSerializerMixin, viewsets.ModelViewSet):
    serializer_class = SubtaskSerializer
    serializer_classes = {'create': SubtaskCreateSerializer}
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Subtask.objects.select_related('task')

    def create(self, request, *args, **kwargs):
        serializer = SubtaskCreateSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        subtask = serializer.save()
        return Response(SubtaskSerializer(subtask).data, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=['post'], url_path='toggle')
    def toggle(self, request, pk=None):
        subtask = self.get_object()
        subtask.concluida = not subtask.concluida
        subtask.save(update_fields=['concluida'])
        return Response(SubtaskSerializer(subtask).data)


class AttachmentViewSet(viewsets.ModelViewSet):
    serializer_class = AttachmentSerializer
    permission_classes = [IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser, JSONParser]

    def get_queryset(self):
        return Attachment.objects.select_related('task')

    def create(self, request, *args, **kwargs):
        """Upload de anexo. Body: multipart/form-data com campos 'task' e 'arquivo'."""
        arquivo = request.FILES.get('arquivo')
        task_id = request.data.get('task')

        if not arquivo:
            return Response({'detail': 'Arquivo é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)
        if not task_id:
            return Response({'detail': 'task é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)

        attachment = Attachment.objects.create(
            task_id=task_id,
            arquivo=arquivo,
            nome_original=arquivo.name,
            mime_type=arquivo.content_type,
            tamanho_bytes=arquivo.size,
        )
        return Response(
            AttachmentSerializer(attachment, context={'request': request}).data,
            status=status.HTTP_201_CREATED,
        )
