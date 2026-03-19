from django.urls import path
from . import views

app_name = 'authentication'

urlpatterns = [
    path('login/', views.CustomTokenObtainPairView.as_view(), name='login'),
    path('refresh/', views.CustomTokenRefreshView.as_view(), name='refresh'),
    path('register/', views.RegisterView.as_view(), name='register'),
    path('me/', views.user_profile, name='user_profile'),
    path('users/', views.users_list, name='users_list'),
    path('logout/', views.logout_view, name='logout'),
]