#!/usr/bin/env python
"""Create a superuser if none exists."""

import os
import django

# Configure Django settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from django.contrib.auth.models import User

def create_superuser():
    """Create a superuser if none exists."""
    if not User.objects.filter(is_superuser=True).exists():
        User.objects.create_superuser(
            username='admin',
            email='admin@tradex.com',
            password='admin123'
        )
        print('✅ Superuser created: admin/admin123')
    else:
        print('ℹ️  Superuser already exists')

if __name__ == '__main__':
    create_superuser()