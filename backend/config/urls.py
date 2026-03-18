from django.contrib import admin
from django.urls import path, include
from django.http import JsonResponse


def api_root(request):
    """Root API endpoint with available endpoints"""
    return JsonResponse({
        'message': 'Tradex Task Manager API',
        'version': '1.0',
        'endpoints': {
            'authentication': '/api/auth/',
            'tasks': '/api/tasks/',
            'admin': '/admin/',
        }
    })


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', api_root, name='api_root'),
    path('api/auth/', include('apps.authentication.urls')),
    path('api/', include('apps.tasks.urls')),
]