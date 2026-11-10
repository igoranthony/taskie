from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


def approve_existing_users(apps, schema_editor):
    """Quem já usava a API continua liberado; só cadastros novos passam por aprovação."""
    User = apps.get_model(settings.AUTH_USER_MODEL)
    UserProfile = apps.get_model('authentication', 'UserProfile')
    UserProfile.objects.bulk_create(
        [UserProfile(usuario_id=u.pk, status='aprovado') for u in User.objects.all()],
        ignore_conflicts=True,
    )


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('authentication', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(db_index=True, default='pendente', max_length=20)),
                ('criado_em', models.DateTimeField(auto_now_add=True)),
                ('atualizado_em', models.DateTimeField(auto_now=True)),
                ('usuario', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Perfil do Usuário',
                'verbose_name_plural': 'Perfis dos Usuários',
            },
        ),
        migrations.RunPython(approve_existing_users, migrations.RunPython.noop),
    ]
