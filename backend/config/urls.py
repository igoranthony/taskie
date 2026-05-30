from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.http import JsonResponse
from django.urls import include, path
from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView


def api_root(request):
    return JsonResponse({
        'message': 'Taskie Task Manager API',
        'version': '2.0',
        'endpoints': {
            'authentication': '/api/auth/',
            'tasks': '/api/tasks/',
            'subtasks': '/api/subtasks/',
            'attachments': '/api/attachments/',
            'projects': '/api/projects/',
            'columns': '/api/columns/',
            'categories': '/api/categories/',
            'settings': '/api/auth/settings/',
            'admin': '/admin/',
            'docs': '/api/docs/',
        },
    })


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', api_root, name='api_root'),
    path('api/auth/', include('apps.authentication.urls')),
    path('api/', include('apps.tasks.urls')),
    path('api/', include('apps.projects.urls')),
    path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
    path('api/docs/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
