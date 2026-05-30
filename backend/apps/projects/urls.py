from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import views

app_name = 'projects'

router = DefaultRouter()
router.register(r'categories', views.CategoryViewSet, basename='category')
router.register(r'projects', views.ProjectViewSet, basename='project')
router.register(r'columns', views.ColumnViewSet, basename='column')

urlpatterns = [
    path('', include(router.urls)),
]
