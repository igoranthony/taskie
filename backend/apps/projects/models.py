import secrets
import string

from django.contrib.auth.models import User
from django.db import models

from apps.core.models import BaseModel, SoftDeleteModel


def _generate_invite_code():
    alphabet = string.ascii_uppercase + string.digits
    return ''.join(secrets.choice(alphabet) for _ in range(8))


class Category(BaseModel):
    """Categorias para organizar projetos"""

    nome = models.CharField(max_length=100)
    criado_por = models.ForeignKey(User, on_delete=models.CASCADE, related_name='categories')

    class Meta:
        verbose_name = 'Categoria'
        verbose_name_plural = 'Categorias'
        ordering = ['nome']
        unique_together = [['nome', 'criado_por']]

    def __str__(self):
        return self.nome

    @property
    def total_projetos(self):
        return self.projects.filter(deletado_em__isnull=True).count()


class Project(SoftDeleteModel):
    """Projetos do zntt-control"""

    STATUS_CHOICES = [
        ('ativo', 'Ativo'),
        ('pausado', 'Pausado'),
        ('concluido', 'Concluído'),
    ]

    nome = models.CharField(max_length=255)
    cor = models.CharField(max_length=7, default='#7c6af7')
    logo = models.ImageField(upload_to='projects/logos/', null=True, blank=True)
    categoria = models.ForeignKey(
        Category, on_delete=models.SET_NULL, null=True, blank=True, related_name='projects'
    )
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='ativo')
    criado_por = models.ForeignKey(User, on_delete=models.CASCADE, related_name='projects')
    invite_code = models.CharField(
        max_length=8, unique=True, default=_generate_invite_code, db_index=True
    )

    class Meta:
        verbose_name = 'Projeto'
        verbose_name_plural = 'Projetos'
        ordering = ['-criado_em']
        indexes = [
            models.Index(fields=['criado_por', '-criado_em']),
            models.Index(fields=['status', '-criado_em']),
            models.Index(fields=['deletado_em']),
        ]

    def __str__(self):
        return self.nome

    @property
    def total_tasks(self):
        return self.tasks.filter(deletado_em__isnull=True).count()

    @property
    def done_tasks(self):
        done_columns = self.columns.filter(is_done_column=True)
        return self.tasks.filter(coluna__in=done_columns, deletado_em__isnull=True).count()

    def refresh_invite_code(self):
        self.invite_code = _generate_invite_code()
        self.save(update_fields=['invite_code'])
        # Pending requests become invalid when the code changes
        self.members.filter(status='pending').update(status='rejected')


class Column(BaseModel):
    """Colunas do board Kanban de um projeto"""

    projeto = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='columns')
    nome = models.CharField(max_length=100)
    posicao = models.IntegerField(default=0)
    is_done_column = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Coluna'
        verbose_name_plural = 'Colunas'
        ordering = ['posicao']
        indexes = [
            models.Index(fields=['projeto', 'posicao']),
        ]

    def __str__(self):
        return f"{self.projeto.nome} › {self.nome}"


class ProjectMember(BaseModel):
    """Membros compartilhados de um projeto (tabela pivot)"""

    STATUS_PENDING = 'pending'
    STATUS_ACCEPTED = 'accepted'
    STATUS_REJECTED = 'rejected'

    STATUS_CHOICES = [
        (STATUS_PENDING, 'Pendente'),
        (STATUS_ACCEPTED, 'Aceito'),
        (STATUS_REJECTED, 'Rejeitado'),
    ]

    projeto = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='members')
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='project_memberships')
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default=STATUS_PENDING)

    class Meta:
        verbose_name = 'Membro do Projeto'
        verbose_name_plural = 'Membros do Projeto'
        unique_together = [['projeto', 'usuario']]
        ordering = ['-criado_em']

    def __str__(self):
        return f"{self.usuario.username} → {self.projeto.nome} ({self.status})"
