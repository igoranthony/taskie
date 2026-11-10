from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import views, views_extra

app_name = 'projects'

router = DefaultRouter()
router.register(r'categories', views.CategoryViewSet, basename='category')
router.register(r'projects', views.ProjectViewSet, basename='project')
router.register(r'columns', views.ColumnViewSet, basename='column')
router.register(r'tags', views_extra.TagViewSet, basename='tag')
router.register(r'templates', views_extra.ProjectTemplateViewSet, basename='template')
router.register(r'trash', views_extra.TrashViewSet, basename='trash')
router.register(r'metrics', views_extra.MetricsViewSet, basename='metrics')

urlpatterns = [
    path('', include(router.urls)),
]
