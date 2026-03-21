#!/usr/bin/env python
"""Create initial users and load fixtures if the database is empty."""

import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from django.contrib.auth.models import User
from django.core.management import call_command


SAMPLE_USERS = [
    {'id': 2, 'username': 'joao.silva',   'email': 'joao.silva@tradex.com',   'password': 'tradex123', 'first_name': 'João',  'last_name': 'Silva'},
    {'id': 3, 'username': 'maria.souza',  'email': 'maria.souza@tradex.com',  'password': 'tradex123', 'first_name': 'Maria', 'last_name': 'Souza'},
]


def create_superuser():
    if not User.objects.filter(username='admin').exists():
        User.objects.create_superuser(
            username='admin',
            email='admin@tradex.com',
            password='admin123',
        )
        print('✅ Superuser criado: admin / admin123')
    else:
        print('ℹ️  Superuser já existe')


def create_sample_users():
    for data in SAMPLE_USERS:
        if not User.objects.filter(username=data['username']).exists():
            user = User.objects.create_user(
                id=data['id'],
                username=data['username'],
                email=data['email'],
                password=data['password'],
                first_name=data['first_name'],
                last_name=data['last_name'],
            )
            print(f'✅ Usuário criado: {user.username} / {data["password"]}')
        else:
            print(f'ℹ️  Usuário já existe: {data["username"]}')


def load_fixtures():
    from apps.tasks.models import Task
    if not Task.objects.exists():
        call_command('loaddata', 'apps/tasks/fixtures/initial_data.json', verbosity=1)
        print('✅ Fixture carregada: initial_data.json')
    else:
        print('ℹ️  Dados já existem, fixture ignorada')


if __name__ == '__main__':
    create_superuser()
    create_sample_users()
    load_fixtures()
