import uuid

from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone

from apps.core.models import BaseModel, SoftDeleteModel


def _normalize_for_comparison(value):
    """Normaliza datetimes para UTC antes de comparar, evitando falsos positivos por timezone."""
    if hasattr(value, 'astimezone'):
        return value.astimezone(timezone.utc)
    return value


class Task(SoftDeleteModel):
    """Modelo principal de tarefas com sistema de auditoria"""

    STATUS_CHOICES = [
        ('backlog', 'Backlog'),
        ('em_andamento', 'Em Andamento'),
        ('concluido', 'Concluído'),
    ]

    PRIORITY_CHOICES = [
        ('', 'Sem prioridade'),
        ('baixa', 'Baixa'),
        ('media', 'Média'),
        ('alta', 'Alta'),
    ]

    titulo = models.CharField(max_length=255)
    descricao = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='backlog')
    # Vazio = sem prioridade (o desktop permite; o mobile lê vazio como 'media').
    prioridade = models.CharField(max_length=10, choices=PRIORITY_CHOICES, default='media', blank=True)
    criado_por = models.ForeignKey(User, on_delete=models.CASCADE, related_name='tasks_created')
    atribuido_para = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True, related_name='tasks_assigned'
    )
    data_limite = models.DateTimeField(null=True, blank=True)

    # Campos de projeto/board — nulos para tasks do app mobile (backward compatible)
    projeto = models.ForeignKey(
        'projects.Project',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='tasks',
    )
    coluna = models.ForeignKey(
        'projects.Column',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='tasks',
    )
    posicao = models.IntegerField(default=0)
    tags = models.ManyToManyField('projects.Tag', blank=True, related_name='tasks')

    class Meta:
        verbose_name = 'Task'
        verbose_name_plural = 'Tasks'
        ordering = ['-criado_em']
        indexes = [
            models.Index(fields=['status', '-criado_em']),
            models.Index(fields=['criado_por', '-criado_em']),
            models.Index(fields=['atribuido_para', '-criado_em']),
            models.Index(fields=['deletado_em']),
            models.Index(fields=['coluna', 'posicao']),
            models.Index(fields=['projeto', '-criado_em']),
        ]

    def __str__(self):
        return f"{self.titulo} - {self.get_status_display()}"

    def save(self, *args, **kwargs):
        """Override save: rastreia mudanças em TaskHistory e sincroniza status com coluna."""
        user = getattr(self, '_history_user', None)

        if self.pk and user:
            old_task = Task.objects.filter(pk=self.pk).first()
            if old_task:
                update_fields = kwargs.get('update_fields', None)
                tracked_fields = [
                    'titulo', 'descricao', 'status', 'prioridade',
                    'atribuido_para', 'data_limite',
                ]
                for field in tracked_fields:
                    if update_fields is None or field in update_fields:
                        old_value = getattr(old_task, field)
                        new_value = getattr(self, field)
                        if _normalize_for_comparison(old_value) != _normalize_for_comparison(new_value):
                            TaskHistory.objects.create(
                                task=self,
                                field_name=field,
                                old_value=str(old_value) if old_value else None,
                                new_value=str(new_value) if new_value else None,
                                changed_by=user,
                            )

        # Sincroniza status com a coluna quando a task pertence a um board
        if self.coluna_id:
            from apps.projects.models import Column as Col
            try:
                col = Col.objects.get(pk=self.coluna_id)
                derived = 'concluido' if col.is_done_column else 'em_andamento'
                if self.status != derived:
                    self.status = derived
            except Col.DoesNotExist:
                pass

        super().save(*args, **kwargs)


class TaskHistory(models.Model):
    """Histórico detalhado de alterações nas tasks"""

    task = models.ForeignKey(Task, on_delete=models.CASCADE, related_name='history')
    field_name = models.CharField(max_length=50)
    old_value = models.TextField(null=True, blank=True)
    new_value = models.TextField(null=True, blank=True)
    changed_by = models.ForeignKey(User, on_delete=models.CASCADE)
    changed_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = 'Histórico de Task'
        verbose_name_plural = 'Histórico de Tasks'
        ordering = ['-changed_at']
        indexes = [
            models.Index(fields=['task', '-changed_at']),
            models.Index(fields=['changed_by', '-changed_at']),
            models.Index(fields=['field_name', '-changed_at']),
        ]

    def __str__(self):
        return f"Task {self.task.id} - {self.field_name} alterado por {self.changed_by.username}"


class Subtask(BaseModel):
    """Subtarefas de uma task"""

    task = models.ForeignKey(Task, on_delete=models.CASCADE, related_name='subtarefas')
    titulo = models.CharField(max_length=255)
    concluida = models.BooleanField(default=False)
    posicao = models.IntegerField(default=0)

    class Meta:
        verbose_name = 'Subtarefa'
        verbose_name_plural = 'Subtarefas'
        ordering = ['posicao', 'criado_em']

    def __str__(self):
        return f"{self.task.titulo} › {self.titulo}"


class Attachment(BaseModel):
    """Arquivos anexados a uma task"""

    task = models.ForeignKey(Task, on_delete=models.CASCADE, related_name='anexos')
    arquivo = models.FileField(upload_to='tasks/attachments/%Y/%m/')
    nome_original = models.CharField(max_length=255)
    mime_type = models.CharField(max_length=100, null=True, blank=True)
    tamanho_bytes = models.BigIntegerField(null=True, blank=True)
    posicao = models.IntegerField(default=0)

    class Meta:
        verbose_name = 'Anexo'
        verbose_name_plural = 'Anexos'
        ordering = ['posicao', 'criado_em']

    def __str__(self):
        return f"{self.task.titulo} › {self.nome_original}"


class TaskActivity(BaseModel):
    """Histórico detalhado da task usado pelo desktop (criação, movimentação,
    campos, subtarefas, anexos, tags, tempo). O TaskHistory acima continua
    sendo o do app mobile.

    `tipo` é string livre no banco; os valores válidos estão em
    apps.tasks.enums.ActivityType. `campo` usa os nomes da API
    (titulo, descricao, prioridade, data_limite, coluna).
    """

    task = models.ForeignKey(Task, on_delete=models.CASCADE, related_name='atividades')
    tipo = models.CharField(max_length=30)
    campo = models.CharField(max_length=30, null=True, blank=True)
    valor_antigo = models.TextField(null=True, blank=True)
    valor_novo = models.TextField(null=True, blank=True)
    usuario = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    # Sem auto_now_add: a importação do desktop preserva a data original.
    ocorrido_em = models.DateTimeField(default=timezone.now, db_index=True)

    class Meta:
        verbose_name = 'Atividade da Task'
        verbose_name_plural = 'Atividades das Tasks'
        ordering = ['-ocorrido_em']
        indexes = [models.Index(fields=['task', '-ocorrido_em'])]

    def __str__(self):
        return f"{self.task_id} {self.tipo}"


class TimeEntry(BaseModel):
    """Lançamento de tempo. `fim` nulo = timer rodando (um por usuário)."""

    task = models.ForeignKey(Task, on_delete=models.CASCADE, related_name='tempos')
    usuario = models.ForeignKey(User, on_delete=models.CASCADE, related_name='tempos')
    inicio = models.DateTimeField()
    fim = models.DateTimeField(null=True, blank=True)
    nota = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Lançamento de Tempo'
        verbose_name_plural = 'Lançamentos de Tempo'
        ordering = ['-inicio']
        indexes = [
            models.Index(fields=['task', '-inicio']),
            models.Index(fields=['usuario', 'fim']),
        ]

    def __str__(self):
        return f"{self.task_id} {self.inicio} → {self.fim}"

    def segundos(self, agora=None):
        fim = self.fim or agora or timezone.now()
        return max(0, int((fim - self.inicio).total_seconds()))
