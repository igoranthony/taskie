"""Quem enxerga o quê. Todas as views novas (e o TaskViewSet) filtram por aqui.

Projeto: dono ou membro aceito.
Task: criada pelo usuário, atribuída a ele ou de um projeto que ele enxerga.
"""
from django.db.models import Q


def projetos_visiveis(user, incluir_arquivados=False):
    from .models import Project

    base = Project.all_objects if incluir_arquivados else Project.objects
    return base.filter(
        Q(criado_por=user) | Q(members__usuario=user, members__status='accepted')
    ).distinct()


def tasks_visiveis(user, incluir_arquivadas=False):
    from apps.tasks.models import Task

    base = Task.all_objects if incluir_arquivadas else Task.objects
    projetos = projetos_visiveis(user, incluir_arquivados=True).values('pk')
    return base.filter(
        Q(criado_por=user) | Q(atribuido_para=user) | Q(projeto__in=projetos)
    )
