from rest_framework import exceptions

from .enums import UserStatus

MESSAGES = {
    UserStatus.PENDENTE: 'Seu cadastro está aguardando aprovação.',
    UserStatus.REJEITADO: 'Seu cadastro não foi aprovado.',
}


def get_user_status(user):
    """Status do cadastro. Usuário sem perfil (caso anômalo) conta como pendente."""
    profile = getattr(user, 'profile', None)
    return profile.status if profile else UserStatus.PENDENTE


def is_user_approved(user):
    return get_user_status(user) == UserStatus.APROVADO


class AccountNotApproved(exceptions.PermissionDenied):
    """403 com `code` legível pelos clientes: account_pendente / account_rejeitado."""

    def __init__(self, user_status):
        message = MESSAGES.get(user_status, 'Seu cadastro não está liberado.')
        super().__init__({'detail': message, 'code': f'account_{user_status}'})


def user_authentication_rule(user):
    """Regra do SimpleJWT (login e refresh): ativo e aprovado."""
    return user is not None and user.is_active and is_user_approved(user)
