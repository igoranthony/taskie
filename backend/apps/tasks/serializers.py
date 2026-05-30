from django.contrib.auth.models import User
from rest_framework import serializers

from .models import Attachment, Subtask, Task, TaskHistory


class SubtaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subtask
        fields = ('id', 'task', 'titulo', 'concluida', 'posicao', 'criado_em')
        read_only_fields = ('id', 'criado_em')


class SubtaskCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subtask
        fields = ('task', 'titulo', 'posicao')

    def validate_titulo(self, value):
        if not value.strip():
            raise serializers.ValidationError("Título não pode estar vazio.")
        return value.strip()


class AttachmentSerializer(serializers.ModelSerializer):
    arquivo_url = serializers.SerializerMethodField()

    class Meta:
        model = Attachment
        fields = (
            'id', 'task', 'arquivo', 'arquivo_url',
            'nome_original', 'mime_type', 'tamanho_bytes', 'criado_em',
        )
        read_only_fields = ('id', 'criado_em', 'arquivo_url', 'nome_original', 'mime_type', 'tamanho_bytes')

    def get_arquivo_url(self, obj):
        request = self.context.get('request')
        if request:
            return request.build_absolute_uri(obj.arquivo.url)
        return obj.arquivo.url


class TaskSerializer(serializers.ModelSerializer):
    """Serializer completo para Task com validações e regras de negócio"""

    criado_por_username = serializers.CharField(source='criado_por.username', read_only=True)
    atribuido_para_username = serializers.CharField(
        source='atribuido_para.username', read_only=True, allow_null=True
    )
    can_edit = serializers.SerializerMethodField()
    subtarefas = SubtaskSerializer(many=True, read_only=True)
    anexos = AttachmentSerializer(many=True, read_only=True)
    subtarefas_total = serializers.SerializerMethodField()
    subtarefas_concluidas = serializers.SerializerMethodField()

    class Meta:
        model = Task
        fields = (
            'id', 'titulo', 'descricao', 'status', 'prioridade',
            'atribuido_para', 'atribuido_para_username', 'data_limite',
            'criado_por', 'criado_por_username', 'criado_em', 'atualizado_em',
            'can_edit',
            'projeto', 'coluna', 'posicao',
            'subtarefas', 'anexos',
            'subtarefas_total', 'subtarefas_concluidas',
        )
        read_only_fields = ('criado_por', 'criado_em', 'atualizado_em')

    def get_can_edit(self, obj):
        request = self.context.get('request')
        return request is not None and obj.criado_por == request.user

    def get_subtarefas_total(self, obj):
        return obj.subtarefas.count()

    def get_subtarefas_concluidas(self, obj):
        return obj.subtarefas.filter(concluida=True).count()

    def validate_titulo(self, value):
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Título não pode estar vazio")
        if len(value.strip()) > 255:
            raise serializers.ValidationError("Título muito longo (máximo 255 caracteres)")
        return value.strip()

    def validate_status(self, value):
        """Irreversibilidade apenas para tasks sem coluna (app mobile)"""
        if self.instance and self.instance.coluna_id is None:
            if self.instance.status == 'concluido' and value != 'concluido':
                raise serializers.ValidationError(
                    "Não é possível alterar status de tarefa concluída"
                )
        return value

    def validate_atribuido_para(self, value):
        if value and not value.is_active:
            raise serializers.ValidationError("Não é possível atribuir para usuário inativo")
        return value

    def validate(self, attrs):
        if 'data_limite' in attrs and attrs['data_limite']:
            from django.utils import timezone
            if attrs['data_limite'] < timezone.now():
                raise serializers.ValidationError({'data_limite': 'Data limite não pode ser no passado'})
        if attrs.get('coluna') and not attrs.get('projeto'):
            raise serializers.ValidationError({'projeto': 'Projeto é obrigatório quando coluna é informada.'})
        return attrs

    def create(self, validated_data):
        validated_data['criado_por'] = self.context['request'].user
        return super().create(validated_data)

    def update(self, instance, validated_data):
        instance._history_user = self.context['request'].user
        return super().update(instance, validated_data)


class TaskHistorySerializer(serializers.ModelSerializer):
    changed_by_username = serializers.CharField(source='changed_by.username', read_only=True)
    task_titulo = serializers.CharField(source='task.titulo', read_only=True)

    class Meta:
        model = TaskHistory
        fields = (
            'id', 'task', 'task_id', 'task_titulo',
            'field_name', 'old_value', 'new_value',
            'changed_by', 'changed_by_username', 'changed_at',
        )
        read_only_fields = (
            'id', 'task', 'task_id', 'task_titulo',
            'field_name', 'old_value', 'new_value',
            'changed_by', 'changed_by_username', 'changed_at',
        )


class TaskCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = ('titulo', 'descricao', 'prioridade', 'atribuido_para', 'data_limite',
                  'projeto', 'coluna', 'posicao')

    def validate_titulo(self, value):
        if not value or len(value.strip()) == 0:
            raise serializers.ValidationError("Título não pode estar vazio")
        return value.strip()

    def validate(self, attrs):
        if attrs.get('coluna') and not attrs.get('projeto'):
            raise serializers.ValidationError({'projeto': 'Projeto é obrigatório quando coluna é informada.'})
        return attrs


class TaskUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = ('titulo', 'descricao', 'status', 'prioridade', 'atribuido_para',
                  'data_limite', 'coluna', 'posicao')

    def validate_status(self, value):
        """Irreversibilidade apenas para tasks sem coluna (app mobile)"""
        if self.instance and self.instance.coluna_id is None:
            if self.instance.status == 'concluido' and value != 'concluido':
                raise serializers.ValidationError(
                    "Não é possível alterar status de tarefa concluída"
                )
        return value
