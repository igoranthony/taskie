from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

from .enums import UserStatus
from .models import UserProfile


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    """Todo usuário novo ganha um perfil. Superusuário já nasce aprovado."""
    if created:
        UserProfile.objects.get_or_create(
            usuario=instance,
            defaults={
                'status': UserStatus.APROVADO if instance.is_superuser else UserStatus.PENDENTE,
            },
        )
