from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Task, TaskHistory


class TaskSerializer(serializers.ModelSerializer):
    """Serializer para Task com validações e regras de negócio"""

    criado_por_username = serializers.CharField(source='criado_por.username', read_only=True)
    atribuido_para_username = serializers.CharField(source='atribuido_para.username', read_only=True)

    class Meta:
        model = Task
        fields = (
            'id', 'titulo', 'descricao', 'status', 'prioridade',
            'atribuido_para', 'atribuido_para_username', 'data_limite',
            'criado_por', 'criado_por_username', 'criado_em', 'atualizado_em'
        )
        read_only_fields = ('criado_por', 'criado_em', 'atualizado_em')

    def validate_titulo(self, value):
        """Validação do título"""
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Título não pode estar vazio")
        if len(value.strip()) > 255:
            raise serializers.ValidationError("Título muito longo (máximo 255 caracteres)")
        return value.strip()

    def validate_status(self, value):
        """Regra: não pode voltar de 'concluido'"""
        if self.instance and self.instance.status == 'concluido' and value != 'concluido':
            raise serializers.ValidationError(
                "Não é possível alterar status de tarefa concluída"
            )
        return value

    def validate_atribuido_para(self, value):
        """Validação do usuário atribuído"""
        if value and not value.is_active:
            raise serializers.ValidationError("Não é possível atribuir para usuário inativo")
        return value

    def validate(self, attrs):
        """Validações cruzadas"""
        if 'data_limite' in attrs and attrs['data_limite']:
            from django.utils import timezone
            if attrs['data_limite'] < timezone.now():
                raise serializers.ValidationError({
                    'data_limite': 'Data limite não pode ser no passado'
                })

        return attrs

    def create(self, validated_data):
        """Cria task com usuário automático"""
        validated_data['criado_por'] = self.context['request'].user
        return super().create(validated_data)

    def update(self, instance, validated_data):
        """Atualiza task com histórico automático"""
        instance._history_user = self.context['request'].user
        return super().update(instance, validated_data)


class TaskHistorySerializer(serializers.ModelSerializer):
    """Serializer para histórico de alterações"""

    changed_by_username = serializers.CharField(source='changed_by.username', read_only=True)
    task_titulo = serializers.CharField(source='task.titulo', read_only=True)

    class Meta:
        model = TaskHistory
        fields = (
            'id', 'task', 'task_id', 'task_titulo',
            'field_name', 'old_value', 'new_value',
            'changed_by', 'changed_by_username', 'changed_at'
        )
        read_only_fields = '__all__'


class TaskCreateSerializer(serializers.ModelSerializer):
    """Serializer específico para criação simplificada"""

    class Meta:
        model = Task
        fields = ('titulo', 'descricao', 'prioridade', 'atribuido_para', 'data_limite')

    def validate_titulo(self, value):
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Título não pode estar vazio")
        return value.strip()


class TaskUpdateSerializer(serializers.ModelSerializer):
    """Serializer específico para atualizações"""

    class Meta:
        model = Task
        fields = ('titulo', 'descricao', 'status', 'prioridade', 'atribuido_para', 'data_limite')

    def validate_status(self, value):
        """Regra: não pode voltar de 'concluido'"""
        if self.instance and self.instance.status == 'concluido' and value != 'concluido':
            raise serializers.ValidationError(
                "Não é possível alterar status de tarefa concluída"
            )
        return value