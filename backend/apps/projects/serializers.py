from rest_framework import serializers

from .models import Category, Column, Project, ProjectMember


class CategorySerializer(serializers.ModelSerializer):
    total_projetos = serializers.ReadOnlyField()

    class Meta:
        model = Category
        fields = ('id', 'nome', 'total_projetos', 'criado_em')
        read_only_fields = ('id', 'criado_em', 'total_projetos')

    def validate_nome(self, value):
        if not value.strip():
            raise serializers.ValidationError("Nome não pode estar vazio.")
        user = self.context['request'].user
        qs = Category.objects.filter(nome__iexact=value.strip(), criado_por=user)
        if self.instance:
            qs = qs.exclude(pk=self.instance.pk)
        if qs.exists():
            raise serializers.ValidationError("Você já tem uma categoria com esse nome.")
        return value.strip()

    def create(self, validated_data):
        validated_data['criado_por'] = self.context['request'].user
        return super().create(validated_data)


class ColumnSerializer(serializers.ModelSerializer):
    class Meta:
        model = Column
        fields = ('id', 'projeto', 'nome', 'posicao', 'is_done_column', 'criado_em')
        read_only_fields = ('id', 'criado_em')


class ColumnCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Column
        fields = ('projeto', 'nome', 'posicao', 'is_done_column')

    def validate_nome(self, value):
        if not value.strip():
            raise serializers.ValidationError("Nome da coluna não pode estar vazio.")
        return value.strip()


class ColumnUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Column
        fields = ('nome', 'is_done_column')

    def validate_nome(self, value):
        if not value.strip():
            raise serializers.ValidationError("Nome da coluna não pode estar vazio.")
        return value.strip()


class TaskCardSerializer(serializers.Serializer):
    """Serializer leve para exibição no board — evita circular import."""

    id = serializers.UUIDField()
    titulo = serializers.CharField()
    descricao = serializers.CharField(allow_null=True)
    posicao = serializers.IntegerField()
    prioridade = serializers.CharField()
    data_limite = serializers.DateTimeField(allow_null=True)
    atribuido_para_username = serializers.CharField(
        source='atribuido_para.username', allow_null=True
    )
    subtarefas_total = serializers.SerializerMethodField()
    subtarefas_concluidas = serializers.SerializerMethodField()
    anexos_total = serializers.SerializerMethodField()
    criado_em = serializers.DateTimeField()

    def get_subtarefas_total(self, obj):
        return obj.subtarefas.count()

    def get_subtarefas_concluidas(self, obj):
        return obj.subtarefas.filter(concluida=True).count()

    def get_anexos_total(self, obj):
        return obj.anexos.count()


class ColumnBoardSerializer(serializers.ModelSerializer):
    """Coluna com tasks aninhadas — usada no endpoint /board/."""

    tasks = serializers.SerializerMethodField()

    class Meta:
        model = Column
        fields = ('id', 'nome', 'posicao', 'is_done_column', 'tasks')

    def get_tasks(self, obj):
        tasks = obj.tasks.filter(
            deletado_em__isnull=True
        ).select_related('atribuido_para').prefetch_related(
            'subtarefas', 'anexos'
        ).order_by('posicao')
        return TaskCardSerializer(tasks, many=True).data


class ProjectMemberSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='usuario.username', read_only=True)
    email = serializers.EmailField(source='usuario.email', read_only=True)

    class Meta:
        model = ProjectMember
        fields = ('id', 'usuario', 'username', 'email', 'status', 'criado_em')
        read_only_fields = ('id', 'criado_em', 'username', 'email')


class ProjectSerializer(serializers.ModelSerializer):
    categoria_nome = serializers.CharField(source='categoria.nome', read_only=True, allow_null=True)
    total_tasks = serializers.ReadOnlyField()
    done_tasks = serializers.ReadOnlyField()
    logo_url = serializers.SerializerMethodField()
    is_owner = serializers.SerializerMethodField()
    invite_code = serializers.SerializerMethodField()
    pending_members_count = serializers.SerializerMethodField()

    class Meta:
        model = Project
        fields = (
            'id', 'nome', 'cor', 'logo', 'logo_url',
            'categoria', 'categoria_nome', 'status',
            'total_tasks', 'done_tasks',
            'criado_em', 'atualizado_em',
            'is_owner', 'invite_code', 'pending_members_count',
        )
        read_only_fields = ('id', 'criado_em', 'atualizado_em', 'logo_url')

    def get_logo_url(self, obj):
        if not obj.logo:
            return None
        request = self.context.get('request')
        if request:
            return request.build_absolute_uri(obj.logo.url)
        return obj.logo.url

    def get_is_owner(self, obj):
        request = self.context.get('request')
        return request is not None and obj.criado_por_id == request.user.pk

    def get_invite_code(self, obj):
        request = self.context.get('request')
        if request and obj.criado_por_id == request.user.pk:
            return obj.invite_code
        return None

    def get_pending_members_count(self, obj):
        request = self.context.get('request')
        if request and obj.criado_por_id == request.user.pk:
            return obj.members.filter(status='pending').count()
        return 0

    def validate_nome(self, value):
        if not value.strip():
            raise serializers.ValidationError("Nome do projeto não pode estar vazio.")
        return value.strip()

    def create(self, validated_data):
        validated_data['criado_por'] = self.context['request'].user
        return super().create(validated_data)


class ProjectCreateSerializer(serializers.ModelSerializer):
    columns = serializers.ListField(
        child=serializers.DictField(), write_only=True, required=False
    )

    class Meta:
        model = Project
        fields = ('nome', 'cor', 'categoria', 'columns')

    def validate_nome(self, value):
        if not value.strip():
            raise serializers.ValidationError("Nome do projeto não pode estar vazio.")
        return value.strip()

    def validate_columns(self, value):
        if not value:
            raise serializers.ValidationError("O projeto precisa ter pelo menos uma coluna.")
        done_count = sum(1 for c in value if c.get('is_done_column', False))
        if done_count != 1:
            raise serializers.ValidationError("Exatamente uma coluna deve ser marcada como done.")
        return value

    def create(self, validated_data):
        columns_data = validated_data.pop('columns', [])
        validated_data['criado_por'] = self.context['request'].user
        project = super().create(validated_data)
        for i, col_data in enumerate(columns_data):
            Column.objects.create(
                projeto=project,
                nome=col_data.get('nome', f'Coluna {i + 1}'),
                posicao=i,
                is_done_column=col_data.get('is_done_column', False),
            )
        return project


class ProjectStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('status',)

    def validate_status(self, value):
        valid = [s[0] for s in Project.STATUS_CHOICES]
        if value not in valid:
            raise serializers.ValidationError(f"Status inválido. Use: {valid}")
        return value


class ProjectJoinSerializer(serializers.Serializer):
    code = serializers.CharField(max_length=8, min_length=8)

    def validate_code(self, value):
        return value.strip().upper()
