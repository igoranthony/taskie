from django.db import models


class ActivityType(models.TextChoices):
    """Tipos de TaskActivity.tipo. Coluna é string livre no banco; a validação
    é feita aqui (mesma lista de src/domains/task/activity.enum.js do desktop)."""

    CREATED = 'created', 'Criada'
    MOVED = 'moved', 'Movida'
    FIELD_CHANGED = 'field_changed', 'Campo alterado'
    ARCHIVED = 'archived', 'Arquivada'
    RESTORED = 'restored', 'Restaurada'
    SUBTASK_ADDED = 'subtask_added', 'Subtarefa adicionada'
    SUBTASK_TOGGLED = 'subtask_toggled', 'Subtarefa marcada'
    SUBTASK_REMOVED = 'subtask_removed', 'Subtarefa removida'
    ATTACHMENT_ADDED = 'attachment_added', 'Anexo adicionado'
    ATTACHMENT_REMOVED = 'attachment_removed', 'Anexo removido'
    TAGS_CHANGED = 'tags_changed', 'Tags alteradas'
    TIME_LOGGED = 'time_logged', 'Tempo registrado'
