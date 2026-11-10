from django.db import transaction
from django.db.models import Q
from django.shortcuts import get_object_or_404
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.parsers import FormParser, JSONParser, MultiPartParser
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from apps.core.mixins import ActionSerializerMixin

from .models import Category, Column, Project, ProjectMember
from .permissions import IsProjectOwner
from .serializers import (
    CategorySerializer,
    ColumnBoardSerializer,
    ColumnCreateSerializer,
    ColumnSerializer,
    ColumnUpdateSerializer,
    ProjectCreateSerializer,
    ProjectJoinSerializer,
    ProjectMemberSerializer,
    ProjectSerializer,
    ProjectStatusSerializer,
)


class CategoryViewSet(viewsets.ModelViewSet):
    serializer_class = CategorySerializer
    permission_classes = [IsAuthenticated]
    pagination_class = None

    def get_queryset(self):
        return Category.objects.filter(criado_por=self.request.user)



class ProjectViewSet(ActionSerializerMixin, viewsets.ModelViewSet):
    serializer_class = ProjectSerializer
    serializer_classes = {
        'update_status': ProjectStatusSerializer,
    }
    parser_classes = [MultiPartParser, FormParser, JSONParser]
    pagination_class = None

    def get_permissions(self):
        # These actions are accessible to both owners and accepted members.
        # The queryset already enforces visibility — only owned/member projects are returned.
        member_ok = {'list', 'retrieve', 'board', 'join'}
        if self.action == 'tags' and self.request.method == 'GET':
            return [IsAuthenticated()]
        if self.action in member_ok:
            return [IsAuthenticated()]
        return [IsAuthenticated(), IsProjectOwner()]

    def get_queryset(self):
        return Project.objects.filter(
            Q(criado_por=self.request.user)
            | Q(members__usuario=self.request.user, members__status='accepted')
        ).select_related('categoria').prefetch_related('columns', 'members').distinct()

    # ── Standard CRUD ──────────────────────────────────────────────────────────

    def create(self, request, *args, **kwargs):
        """Cria projeto usando ProjectCreateSerializer e devolve ProjectSerializer completo (com id)."""
        serializer = ProjectCreateSerializer(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        project = serializer.save()
        return Response(
            ProjectSerializer(project, context={'request': request}).data,
            status=status.HTTP_201_CREATED,
        )

    @action(detail=True, methods=['patch'], url_path='status')
    def update_status(self, request, pk=None):
        project = self.get_object()
        serializer = ProjectStatusSerializer(project, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(ProjectSerializer(project, context={'request': request}).data)

    @action(detail=True, methods=['post', 'delete'], url_path='logo', parser_classes=[MultiPartParser, FormParser])
    def upload_logo(self, request, pk=None):
        project = self.get_object()
        if request.method == 'DELETE':
            if project.logo:
                project.logo.delete(save=False)
            project.logo = None
            project.save(update_fields=['logo'])
            return Response(ProjectSerializer(project, context={'request': request}).data)
        if 'logo' not in request.FILES:
            return Response({'detail': 'Nenhum arquivo enviado.'}, status=status.HTTP_400_BAD_REQUEST)
        project.logo = request.FILES['logo']
        project.save(update_fields=['logo'])
        return Response(ProjectSerializer(project, context={'request': request}).data)

    @action(detail=True, methods=['get'], url_path='board')
    def board(self, request, pk=None):
        """Board completo: colunas + tasks aninhadas. Acessível a owners e membros aceitos."""
        project = self.get_object()  # 404 if not in queryset (not owner/member)
        columns = project.columns.prefetch_related(
            'tasks__subtarefas', 'tasks__anexos', 'tasks__atribuido_para'
        ).order_by('posicao')
        return Response(ColumnBoardSerializer(columns, many=True).data)

    @action(detail=True, methods=['get', 'put'], url_path='tags')
    def tags(self, request, pk=None):
        """GET/PUT /projects/{id}/tags/ — PUT { "ids": [...] }. Tags que saem do
        projeto também saem das tasks dele."""
        project = self.get_object()
        if request.method == 'PUT':
            from .models import Tag
            novas = Tag.objects.filter(criado_por=request.user, pk__in=request.data.get('ids', []))
            with transaction.atomic():
                project.tags.set(novas)
                from apps.tasks.models import Task
                for task in Task.all_objects.filter(projeto=project).prefetch_related('tags'):
                    fora = [t for t in task.tags.all() if t not in novas]
                    if fora:
                        task.tags.remove(*fora)
        return Response([
            {'id': str(t.id), 'nome': t.nome, 'cor': t.cor} for t in project.tags.order_by('nome')
        ])

    @action(detail=True, methods=['put'], url_path='columns/reorder')
    def reorder_columns(self, request, pk=None):
        """Reordena colunas. Body: { "ids": ["uuid1", "uuid2"] }"""
        project = self.get_object()
        ids = request.data.get('ids', [])
        if not ids:
            return Response({'detail': 'Lista de ids é obrigatória.'}, status=status.HTTP_400_BAD_REQUEST)
        with transaction.atomic():
            for posicao, col_id in enumerate(ids):
                Column.objects.filter(pk=col_id, projeto=project).update(posicao=posicao)
        return Response({'status': 'ok'})

    # ── Sharing: invite code ────────────────────────────────────────────────────

    @action(detail=True, methods=['get'], url_path='invite-code')
    def invite_code(self, request, pk=None):
        """Retorna o código de convite. Apenas o dono pode ver."""
        project = self.get_object()
        if project.criado_por != request.user:
            return Response(
                {'detail': 'Apenas o dono pode ver o código de convite.'},
                status=status.HTTP_403_FORBIDDEN,
            )
        return Response({'invite_code': project.invite_code})

    @action(detail=True, methods=['post'], url_path='invite-code/refresh')
    def refresh_invite_code(self, request, pk=None):
        """Gera novo código. Solicitações pendentes existentes são rejeitadas."""
        project = self.get_object()
        if project.criado_por != request.user:
            return Response(
                {'detail': 'Apenas o dono pode renovar o código de convite.'},
                status=status.HTTP_403_FORBIDDEN,
            )
        project.refresh_invite_code()
        return Response({'invite_code': project.invite_code})

    # ── Sharing: join request ───────────────────────────────────────────────────

    @action(detail=False, methods=['post'], url_path='join')
    def join(self, request):
        """Envia solicitação de acesso a um projeto via código de convite.
        Body: { "code": "ABCD1234" }
        """
        serializer = ProjectJoinSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        code = serializer.validated_data['code']

        try:
            project = Project.objects.get(invite_code=code)
        except Project.DoesNotExist:
            return Response({'detail': 'Código de convite inválido.'}, status=status.HTTP_404_NOT_FOUND)

        if project.criado_por == request.user:
            return Response(
                {'detail': 'Você já é o dono deste projeto.'},
                status=status.HTTP_400_BAD_REQUEST,
            )

        existing = ProjectMember.objects.filter(projeto=project, usuario=request.user).first()

        if existing:
            if existing.status == ProjectMember.STATUS_ACCEPTED:
                return Response(
                    {'detail': 'Você já é membro deste projeto.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            if existing.status == ProjectMember.STATUS_PENDING:
                return Response(
                    {'detail': 'Sua solicitação já está pendente de aprovação.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            # Rejected → allow a new request
            existing.status = ProjectMember.STATUS_PENDING
            existing.save(update_fields=['status'])
            return Response(
                {'detail': f'Solicitação reenviada para "{project.nome}". Aguarde o dono aprovar.',
                 'project_name': project.nome},
                status=status.HTTP_200_OK,
            )

        ProjectMember.objects.create(projeto=project, usuario=request.user)
        return Response(
            {'detail': f'Solicitação enviada para "{project.nome}". Aguarde o dono aprovar.',
             'project_name': project.nome},
            status=status.HTTP_201_CREATED,
        )

    # ── Sharing: member management (owner only) ────────────────────────────────

    @action(detail=True, methods=['get'], url_path='members')
    def members(self, request, pk=None):
        """Lista todos os membros do projeto (pending + accepted). Apenas o dono."""
        project = self.get_object()
        if project.criado_por != request.user:
            return Response(
                {'detail': 'Apenas o dono pode ver os membros.'},
                status=status.HTTP_403_FORBIDDEN,
            )
        qs = project.members.select_related('usuario').order_by('status', '-criado_em')
        return Response(ProjectMemberSerializer(qs, many=True).data)

    @action(detail=True, methods=['post'], url_path='accept-member')
    def accept_member(self, request, pk=None):
        """Aceita uma solicitação pendente. Body: { "user_id": 123 }"""
        project = self.get_object()
        if project.criado_por != request.user:
            return Response(
                {'detail': 'Apenas o dono pode aceitar membros.'},
                status=status.HTTP_403_FORBIDDEN,
            )
        user_id = request.data.get('user_id')
        if not user_id:
            return Response({'detail': 'user_id é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)

        member = get_object_or_404(ProjectMember, projeto=project, usuario_id=user_id)
        if member.status != ProjectMember.STATUS_PENDING:
            return Response(
                {'detail': 'Apenas solicitações pendentes podem ser aceitas.'},
                status=status.HTTP_400_BAD_REQUEST,
            )
        member.status = ProjectMember.STATUS_ACCEPTED
        member.save(update_fields=['status'])
        return Response(ProjectMemberSerializer(member).data)

    @action(detail=True, methods=['post'], url_path='reject-member')
    def reject_member(self, request, pk=None):
        """Rejeita uma solicitação pendente. Body: { "user_id": 123 }"""
        project = self.get_object()
        if project.criado_por != request.user:
            return Response(
                {'detail': 'Apenas o dono pode rejeitar membros.'},
                status=status.HTTP_403_FORBIDDEN,
            )
        user_id = request.data.get('user_id')
        if not user_id:
            return Response({'detail': 'user_id é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)

        member = get_object_or_404(ProjectMember, projeto=project, usuario_id=user_id)
        if member.status != ProjectMember.STATUS_PENDING:
            return Response(
                {'detail': 'Apenas solicitações pendentes podem ser rejeitadas.'},
                status=status.HTTP_400_BAD_REQUEST,
            )
        member.status = ProjectMember.STATUS_REJECTED
        member.save(update_fields=['status'])
        return Response({'detail': 'Solicitação rejeitada.'})

    @action(detail=True, methods=['post'], url_path='remove-member')
    def remove_member(self, request, pk=None):
        """Remove um membro aceito do projeto. Body: { "user_id": 123 }"""
        project = self.get_object()
        if project.criado_por != request.user:
            return Response(
                {'detail': 'Apenas o dono pode remover membros.'},
                status=status.HTTP_403_FORBIDDEN,
            )
        user_id = request.data.get('user_id')
        if not user_id:
            return Response({'detail': 'user_id é obrigatório.'}, status=status.HTTP_400_BAD_REQUEST)

        member = get_object_or_404(ProjectMember, projeto=project, usuario_id=user_id)
        member.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class ColumnViewSet(ActionSerializerMixin, viewsets.ModelViewSet):
    serializer_class = ColumnSerializer
    pagination_class = None
    serializer_classes = {
        'update': ColumnUpdateSerializer,
        'partial_update': ColumnUpdateSerializer,
    }
    permission_classes = [IsAuthenticated, IsProjectOwner]

    def get_queryset(self):
        return Column.objects.filter(
            projeto__criado_por=self.request.user
        ).select_related('projeto')

    def create(self, request, *args, **kwargs):
        """Cria coluna e devolve ColumnSerializer completo (com id)."""
        serializer = ColumnCreateSerializer(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        instance = serializer.save()
        if instance.is_done_column:
            Column.objects.filter(projeto=instance.projeto).exclude(pk=instance.pk).update(is_done_column=False)
        return Response(ColumnSerializer(instance).data, status=status.HTTP_201_CREATED)

    def perform_update(self, serializer):
        instance = serializer.save()
        if instance.is_done_column:
            Column.objects.filter(projeto=instance.projeto).exclude(pk=instance.pk).update(is_done_column=False)
        self._sync_tasks_status(instance)

    def _sync_tasks_status(self, column):
        from apps.tasks.models import Task
        new_status = 'concluido' if column.is_done_column else 'em_andamento'
        Task.objects.filter(coluna=column).update(status=new_status)

    @action(detail=True, methods=['get'])
    def contagem(self, request, pk=None):
        """GET /columns/{id}/contagem/ — inclui tasks arquivadas (que também mudam de coluna)."""
        from apps.tasks.models import Task
        column = self.get_object()
        total = Task.all_objects.filter(coluna=column).count()
        ativas = Task.objects.filter(coluna=column).count()
        return Response({'total': total, 'ativas': ativas, 'arquivadas': total - ativas})

    def destroy(self, request, *args, **kwargs):
        """DELETE /columns/{id}/?mover_para=<coluna> — com tasks, exige o destino
        (mesmo projeto); elas vão para o fim dele, na ordem em que estavam."""
        from django.db.models import Max
        from apps.tasks.models import Task

        column = self.get_object()
        tasks = Task.all_objects.filter(coluna=column).order_by('posicao')
        if tasks.exists():
            destino_id = request.query_params.get('mover_para')
            if not destino_id:
                return Response(
                    {'detail': f'A coluna tem {tasks.count()} tarefa(s). Informe mover_para.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            destino = Column.objects.filter(pk=destino_id, projeto=column.projeto).exclude(pk=column.pk).first()
            if not destino:
                return Response({'detail': 'Coluna de destino inválida.'}, status=status.HTTP_400_BAD_REQUEST)
            novo_status = 'concluido' if destino.is_done_column else 'em_andamento'
            with transaction.atomic():
                base = Task.all_objects.filter(coluna=destino).aggregate(m=Max('posicao'))['m']
                base = (base if base is not None else -1) + 1
                for i, task in enumerate(tasks):
                    Task.all_objects.filter(pk=task.pk).update(coluna=destino, posicao=base + i, status=novo_status)
                column.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        return super().destroy(request, *args, **kwargs)
