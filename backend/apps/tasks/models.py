import uuid
from django.db import models
from django.contrib.auth.models import User
from apps.core.models import BaseModel


class Task(BaseModel):
    """Modelo principal de tarefas com sistema de auditoria"""

    STATUS_CHOICES = [
        ('backlog', 'Backlog'),
        ('em_andamento', 'Em Andamento'),
        ('concluido', 'Concluído'),
    ]

    PRIORITY_CHOICES = [
        ('baixa', 'Baixa'),
        ('media', 'Média'),
        ('alta', 'Alta'),
    ]

    titulo = models.CharField(max_length=255)
    descricao = models.TextField(blank=True, null=True)
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='backlog'
    )
    prioridade = models.CharField(
        max_length=10,
        choices=PRIORITY_CHOICES,
        default='media'
    )
    criado_por = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='tasks_created'
    )
    atribuido_para = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='tasks_assigned'
    )
    data_limite = models.DateTimeField(null=True, blank=True)

    class Meta:
        verbose_name = 'Task'
        verbose_name_plural = 'Tasks'
        ordering = ['-criado_em']
        indexes = [
            models.Index(fields=['status', '-criado_em']),
            models.Index(fields=['criado_por', '-criado_em']),
            models.Index(fields=['atribuido_para', '-criado_em']),
        ]

    def __str__(self):
        return f"{self.titulo} - {self.get_status_display()}"

    def save(self, *args, **kwargs):
        """Override save method to track changes in TaskHistory"""
        user = getattr(self, '_history_user', None)

        if self.pk and user:
            old_task = Task.objects.filter(pk=self.pk).first()
            if not old_task:
                return super().save(*args, **kwargs)

            update_fields = kwargs.get('update_fields', None)
            tracked_fields = [
                'titulo', 'descricao', 'status', 'prioridade',
                'atribuido_para', 'data_limite'
            ]

            for field in tracked_fields:
                if update_fields is None or field in update_fields:
                    old_value = getattr(old_task, field)
                    new_value = getattr(self, field)

                    if old_value != new_value:
                        TaskHistory.objects.create(
                            task=self,
                            field_name=field,
                            old_value=str(old_value) if old_value else None,
                            new_value=str(new_value) if new_value else None,
                            changed_by=user
                        )

        super().save(*args, **kwargs)


class TaskHistory(models.Model):
    """Histórico detalhado de alterações nas tasks"""

    task = models.ForeignKey(
        Task,
        on_delete=models.CASCADE,
        related_name='history'
    )
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