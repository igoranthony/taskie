from django.db import models


class UserStatus(models.TextChoices):
    """Situação do cadastro. Só `APROVADO` consegue logar e usar a API."""

    PENDENTE = 'pendente', 'Pendente'
    APROVADO = 'aprovado', 'Aprovado'
    REJEITADO = 'rejeitado', 'Rejeitado'
