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
