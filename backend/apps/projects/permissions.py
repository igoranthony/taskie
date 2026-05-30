from rest_framework import permissions


class IsProjectOwner(permissions.BasePermission):
    """Permite escrita apenas ao criador do projeto.
    Leitura (GET/HEAD/OPTIONS) é permitida — o queryset controla visibilidade.
    """

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        if hasattr(obj, 'criado_por'):
            return obj.criado_por == request.user
        if hasattr(obj, 'projeto'):
            return obj.projeto.criado_por == request.user
        return False
