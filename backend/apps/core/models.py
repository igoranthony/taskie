from django.db import models
from django.utils import timezone
import uuid


class BaseModel(models.Model):
    """Base model with common fields for all models"""

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class SoftDeleteQuerySet(models.QuerySet):
    def delete(self):
        return self.update(deletado_em=timezone.now())

    def hard_delete(self):
        return super().delete()

    def alive(self):
        return self.filter(deletado_em__isnull=True)

    def deleted(self):
        return self.filter(deletado_em__isnull=False)


class SoftDeleteManager(models.Manager):
    def get_queryset(self):
        return SoftDeleteQuerySet(self.model, using=self._db).alive()

    def all_with_deleted(self):
        return SoftDeleteQuerySet(self.model, using=self._db)


class SoftDeleteModel(BaseModel):
    """BaseModel with soft delete support"""

    deletado_em = models.DateTimeField(null=True, blank=True, db_index=True)

    objects = SoftDeleteManager()
    all_objects = models.Manager()

    class Meta:
        abstract = True

    def delete(self, using=None, keep_parents=False):
        self.deletado_em = timezone.now()
        self.save(update_fields=['deletado_em'])

    def hard_delete(self, using=None, keep_parents=False):
        super().delete(using=using, keep_parents=keep_parents)

    @property
    def is_deleted(self):
        return self.deletado_em is not None
