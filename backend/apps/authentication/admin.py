from django.contrib import admin

from .models import UserProfile, UserSettings


@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'status', 'criado_em')
    list_filter = ('status',)
    list_editable = ('status',)
    search_fields = ('usuario__username', 'usuario__email')


@admin.register(UserSettings)
class UserSettingsAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'tema', 'cor_accent')
