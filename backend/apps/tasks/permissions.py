from rest_framework import permissions


class IsOwnerOrReadOnly(permissions.BasePermission):
    """
    Permissão customizada que permite:
    - Read permissions para qualquer usuário autenticado
    - Write permissions apenas para o criador da task
    """
    
    def has_object_permission(self, request, view, obj):
        # Read permissions para qualquer usuário autenticado
        if request.method in permissions.SAFE_METHODS:
            return True
        
        # Write permissions apenas para o criador
        return obj.criado_por == request.user


class IsOwnerOrAssignedOrReadOnly(permissions.BasePermission):
    """
    Permissão avançada que permite:
    - Read permissions para qualquer usuário autenticado
    - Write permissions para criador OU usuário atribuído
    """
    
    def has_object_permission(self, request, view, obj):
        # Read permissions para qualquer usuário autenticado
        if request.method in permissions.SAFE_METHODS:
            return True
        
        # Write permissions para criador ou usuário atribuído
        return (obj.criado_por == request.user or 
                obj.atribuido_para == request.user)