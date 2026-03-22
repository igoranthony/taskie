from django.contrib import admin
from django.urls import path, include
from django.http import JsonResponse
from drf_spectacular.views import SpectacularAPIView, SpectacularSwaggerView, SpectacularRedocView


def api_root(request):
    """Root API endpoint with available endpoints"""
    return JsonResponse({
        'message': 'Tradex Task Manager API',
        'version': '1.0',
        'endpoints': {
            'authentication': '/api/auth/',
            'tasks': '/api/tasks/',
            'admin': '/admin/',
            'docs': '/api/docs/',
        }
    })


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', api_root, name='api_root'),
    path('api/auth/', include('apps.authentication.urls')),
    path('api/', include('apps.tasks.urls')),
    path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
    path('api/docs/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
]