from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import views

app_name = 'tasks'

router = DefaultRouter()
router.register(r'tasks', views.TaskViewSet, basename='task')
router.register(r'subtasks', views.SubtaskViewSet, basename='subtask')
router.register(r'attachments', views.AttachmentViewSet, basename='attachment')

urlpatterns = [
    path('', include(router.urls)),
]
