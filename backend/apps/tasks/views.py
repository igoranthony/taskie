from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.db import models
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import OrderingFilter

from .models import Task, TaskHistory
from .serializers import (
    TaskSerializer,
    TaskHistorySerializer,
    TaskCreateSerializer,
    TaskUpdateSerializer
)
from .permissions import IsOwnerOrReadOnly
from .filters import TaskFilter


class TaskViewSet(viewsets.ModelViewSet):
    """ViewSet completo para Tasks com CRUD e histórico"""

    serializer_class = TaskSerializer
    permission_classes = [IsAuthenticated, IsOwnerOrReadOnly]
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filterset_class = TaskFilter
    ordering_fields = ['criado_em', 'atualizado_em', 'data_limite', 'titulo']
    ordering = ['-criado_em']

    def get_queryset(self):
        """Otimiza queries com select_related"""
        return Task.objects.select_related(
            'criado_por',
            'atribuido_para'
        ).all()

    def get_serializer_class(self):
        """Usa serializers específicos por ação"""
        if self.action == 'create':
            return TaskCreateSerializer
        elif self.action in ['update', 'partial_update']:
            return TaskUpdateSerializer
        return TaskSerializer

    def perform_create(self, serializer):
        """Cria task com usuário automático"""
        serializer.save(criado_por=self.request.user)

    def perform_update(self, serializer):
        """Atualiza com histórico automático"""
        instance = serializer.instance
        instance._history_user = self.request.user
        serializer.save()

    def perform_destroy(self, instance):
        """Delete task - histórico será removido em CASCADE"""
        instance.delete()

    @action(detail=True, methods=['get'])
    def history(self, request, pk=None):
        """🚀 ENDPOINT DIFERENCIAL: GET /tasks/{id}/history/"""
        task = self.get_object()

        self.check_object_permissions(request, task)

        history = TaskHistory.objects.filter(
            task=task
        ).select_related('changed_by', 'task').order_by('-changed_at')

        serializer = TaskHistorySerializer(history, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['get'])
    def my_tasks(self, request):
        """Tasks criadas pelo usuário atual"""
        tasks = self.get_queryset().filter(criado_por=request.user)

        page = self.paginate_queryset(tasks)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(tasks, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['get'])
    def assigned_to_me(self, request):
        """Tasks atribuídas ao usuário atual"""
        tasks = self.get_queryset().filter(atribuido_para=request.user)

        page = self.paginate_queryset(tasks)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(tasks, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['get'])
    def stats(self, request):
        """Estatísticas básicas das tasks do usuário"""
        user_tasks = self.get_queryset().filter(criado_por=request.user)

        stats = {
            'total': user_tasks.count(),
            'backlog': user_tasks.filter(status='backlog').count(),
            'em_andamento': user_tasks.filter(status='em_andamento').count(),
            'concluido': user_tasks.filter(status='concluido').count(),
            'alta_prioridade': user_tasks.filter(prioridade='alta').count(),
            'media_prioridade': user_tasks.filter(prioridade='media').count(),
            'baixa_prioridade': user_tasks.filter(prioridade='baixa').count(),
        }

        return Response(stats)