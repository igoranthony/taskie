from django.contrib import admin

from .models import Category, Column, Project, ProjectMember


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('nome', 'criado_por', 'total_projetos', 'criado_em')
    list_filter = ('criado_por',)
    search_fields = ('nome',)


class ColumnInline(admin.TabularInline):
    model = Column
    extra = 0
    fields = ('nome', 'posicao', 'is_done_column')


class ProjectMemberInline(admin.TabularInline):
    model = ProjectMember
    extra = 0
    fields = ('usuario', 'status', 'criado_em')
    readonly_fields = ('criado_em',)


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('nome', 'status', 'criado_por', 'categoria', 'invite_code', 'criado_em')
    list_filter = ('status', 'criado_por')
    search_fields = ('nome', 'invite_code')
    readonly_fields = ('invite_code',)
    inlines = [ColumnInline, ProjectMemberInline]


@admin.register(Column)
class ColumnAdmin(admin.ModelAdmin):
    list_display = ('nome', 'projeto', 'posicao', 'is_done_column')
    list_filter = ('projeto', 'is_done_column')
    search_fields = ('nome',)


@admin.register(ProjectMember)
class ProjectMemberAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'projeto', 'status', 'criado_em')
    list_filter = ('status', 'projeto')
    search_fields = ('usuario__username', 'projeto__nome')
