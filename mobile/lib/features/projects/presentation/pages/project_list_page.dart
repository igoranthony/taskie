import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/app_empty_state.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/confirm_dialog.dart';
import '../../../authentication/presentation/bloc/auth_bloc.dart';
import '../../../authentication/presentation/bloc/auth_event.dart';
import '../../../authentication/presentation/bloc/auth_state.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/delete_project.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/update_project_status.dart';
import '../bloc/project_list/project_list_bloc.dart';
import '../bloc/project_list/project_list_event.dart';
import '../bloc/project_list/project_list_state.dart';
import '../widgets/project_card.dart';

class ProjectListPage extends StatelessWidget {
  const ProjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProjectListBloc(
        getProjects: getIt<GetProjects>(),
        updateProjectStatus: getIt<UpdateProjectStatus>(),
        deleteProject: getIt<DeleteProject>(),
      )..add(const ProjectListEvent.loaded()),
      child: const _ProjectListView(),
    );
  }
}

class _ProjectListView extends StatelessWidget {
  const _ProjectListView();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const SizedBox(height: 12),
            const Expanded(child: _Content()),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TASKIE',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 13,
                    color: cs.primary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Escolha um projeto para ver suas tarefas',
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _IconAction(
            icon: Icons.add,
            onPressed: () async {
              final created = await context.push<Project>(AppRoutes.projectCreate);
              if (created != null && context.mounted) {
                context
                    .read<ProjectListBloc>()
                    .add(ProjectListEvent.projectUpserted(created));
              }
            },
          ),
          const SizedBox(width: 8),
          _IconAction(
            icon: Icons.logout,
            onPressed: () => ConfirmDialog.show(
              context,
              title: 'Sair',
              message: 'Tem certeza que deseja sair da sua conta?',
              confirmLabel: 'Sair',
              onConfirm: () async {
                final authBloc = context.read<AuthBloc>();
                final completer = Completer<void>();
                late StreamSubscription sub;
                sub = authBloc.stream.listen((state) {
                  state.whenOrNull(
                    unauthenticated: () {
                      if (!completer.isCompleted) completer.complete();
                      sub.cancel();
                    },
                  );
                });
                authBloc.add(const AuthEvent.logoutRequested());
                await completer.future;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _IconAction({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: cs.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 20, color: cs.onSurface),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectListBloc, ProjectListState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: AppLoading()),
        loading: () => const Center(child: AppLoading()),
        success: (projects) => RefreshIndicator(
          onRefresh: () async => context
              .read<ProjectListBloc>()
              .add(const ProjectListEvent.refreshed()),
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
            itemCount: projects.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) return const _UnassignedCard();
              if (projects.isEmpty && index == 1) {
                return const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: AppEmptyState(
                    icon: Icons.folder_open_outlined,
                    title: 'Você ainda não tem projetos',
                    subtitle: 'Toque em "Novo projeto" para começar',
                  ),
                );
              }
              final project = projects[index - 1];
              return ProjectCard(
                project: project,
                onTap: () async {
                  final refreshed = await context.push<bool>(
                    AppRoutes.projectTasks(project.id),
                    extra: project,
                  );
                  if (refreshed == true && context.mounted) {
                    context
                        .read<ProjectListBloc>()
                        .add(const ProjectListEvent.refreshed());
                  }
                },
                onAction: (action) => _handleAction(context, project, action),
              );
            },
          ),
        ),
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar projetos',
          onRetry: () => context
              .read<ProjectListBloc>()
              .add(const ProjectListEvent.loaded()),
        ),
      ),
    );
  }

  Future<void> _handleAction(
    BuildContext context,
    Project project,
    ProjectAction action,
  ) async {
    final bloc = context.read<ProjectListBloc>();
    switch (action) {
      case ProjectAction.edit:
        final updated = await context.push<Project>(
          AppRoutes.projectEdit(project.id),
          extra: project,
        );
        if (updated != null) {
          bloc.add(ProjectListEvent.projectUpserted(updated));
        }
      case ProjectAction.ativar:
        bloc.add(ProjectListEvent.statusChanged(project.id, ProjectStatus.ativo));
      case ProjectAction.pausar:
        bloc.add(ProjectListEvent.statusChanged(project.id, ProjectStatus.pausado));
      case ProjectAction.concluir:
        bloc.add(ProjectListEvent.statusChanged(project.id, ProjectStatus.concluido));
      case ProjectAction.delete:
        final confirmed = await ConfirmDialog.show(
          context,
          title: 'Excluir projeto',
          message:
              'Tem certeza que deseja excluir o projeto "${project.nome}"? Todas as tarefas vinculadas ficarão sem projeto.',
          confirmLabel: 'Excluir',
          destructive: true,
        );
        if (confirmed && context.mounted) {
          bloc.add(ProjectListEvent.deleted(project.id));
          AppSnackbar.success(context, 'Projeto excluído.');
        }
    }
  }
}

class _UnassignedCard extends StatelessWidget {
  const _UnassignedCard();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: cs.shadow.withValues(alpha: 0.08),
        child: InkWell(
          onTap: () => context.push(AppRoutes.projectsUnassignedTasks),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.inbox_outlined, color: cs.onSurfaceVariant),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sem projeto',
                        style: tt.titleSmall?.copyWith(
                          color: cs.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Tarefas que não pertencem a nenhum projeto',
                        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
