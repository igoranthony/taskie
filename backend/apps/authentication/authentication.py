from rest_framework_simplejwt.authentication import JWTAuthentication

from .status import AccountNotApproved, get_user_status, is_user_approved


class ApprovedJWTAuthentication(JWTAuthentication):
    """JWT que recusa token de usuário que deixou de estar aprovado."""

    def get_user(self, validated_token):
        user = super().get_user(validated_token)
        if not is_user_approved(user):
            raise AccountNotApproved(get_user_status(user))
        return user


try:
    from drf_spectacular.contrib.rest_framework_simplejwt import SimpleJWTScheme

    class ApprovedJWTScheme(SimpleJWTScheme):
        """Mantém o Bearer JWT documentado no Swagger com a classe própria."""

        target_class = 'apps.authentication.authentication.ApprovedJWTAuthentication'
        name = 'jwtAuth'
except ImportError:  # drf-spectacular é opcional para a API rodar
    pass
