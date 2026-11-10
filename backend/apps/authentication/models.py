from django.contrib.auth.models import User
from django.db import models


class UserSettings(models.Model):
    """Preferências de UI por usuário (tema, cor accent)"""

    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name='settings')
    tema = models.CharField(max_length=20, default='dark')
    cor_accent = models.CharField(max_length=7, default='#6366f1')
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Configurações do Usuário'
        verbose_name_plural = 'Configurações dos Usuários'

    def __str__(self):
        return f"Settings de {self.usuario.username}"


class UserProfile(models.Model):
    """Situação do cadastro do usuário.

    `status` é string livre no banco; os valores válidos ficam em
    `apps.authentication.enums.UserStatus`. A aprovação por enquanto é manual:
    trocar `status` para 'aprovado' no banco ou no admin.
    """

    usuario = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    status = models.CharField(max_length=20, default='pendente', db_index=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Perfil do Usuário'
        verbose_name_plural = 'Perfis dos Usuários'

    def __str__(self):
        return f"{self.usuario.username} ({self.status})"

    def clean(self):
        from django.core.exceptions import ValidationError

        from .enums import UserStatus

        if self.status not in UserStatus.values:
            raise ValidationError({'status': f'Status inválido: {self.status}'})

    @property
    def is_aprovado(self):
        from .enums import UserStatus

        return self.status == UserStatus.APROVADO
