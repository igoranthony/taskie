import django_filters
from django.db.models import Q

from .models import Task


class TaskFilter(django_filters.FilterSet):
    """Filtros para Tasks"""

    status = django_filters.ChoiceFilter(choices=Task.STATUS_CHOICES)
    prioridade = django_filters.ChoiceFilter(choices=Task.PRIORITY_CHOICES)

    criado_por = django_filters.NumberFilter(field_name='criado_por__id')
    atribuido_para = django_filters.NumberFilter(field_name='atribuido_para__id')

    criado_em_inicio = django_filters.DateTimeFilter(field_name='criado_em', lookup_expr='gte')
    criado_em_fim = django_filters.DateTimeFilter(field_name='criado_em', lookup_expr='lte')

    data_limite_inicio = django_filters.DateTimeFilter(field_name='data_limite', lookup_expr='gte')
    data_limite_fim = django_filters.DateTimeFilter(field_name='data_limite', lookup_expr='lte')

    titulo = django_filters.CharFilter(lookup_expr='icontains')
    descricao = django_filters.CharFilter(lookup_expr='icontains')
    search = django_filters.CharFilter(method='filter_search')

    # Novos filtros para board
    projeto = django_filters.UUIDFilter(field_name='projeto__id')
    coluna = django_filters.UUIDFilter(field_name='coluna__id')

    def filter_search(self, queryset, name, value):
        """Busca por título OU descrição (case-insensitive)"""
        return queryset.filter(
            Q(titulo__icontains=value) | Q(descricao__icontains=value)
        )

    class Meta:
        model = Task
        fields = {
            'status': ['exact'],
            'prioridade': ['exact'],
            'criado_por': ['exact'],
            'atribuido_para': ['exact'],
            'projeto': ['exact'],
            'coluna': ['exact'],
        }
