import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../features/authentication/presentation/bloc/auth_state.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/projects/domain/entities/project.dart';
import '../../features/projects/presentation/pages/project_form_page.dart';
import '../../features/projects/presentation/pages/project_list_page.dart';
import '../../features/tasks/domain/entities/task.dart';
import '../../features/tasks/presentation/pages/task_list_page.dart';
import '../../features/tasks/presentation/pages/task_detail_page.dart';
import '../../features/tasks/presentation/pages/task_form_page.dart';
import '../../features/tasks/presentation/pages/task_history_page.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const projects = '/projects';
  static const projectCreate = '/projects/create';
  static const projectsUnassignedTasks = '/projects/none/tasks';
  static String projectEdit(String id) => '/projects/$id/edit';
  static String projectTasks(String id) => '/projects/$id/tasks';

  static const tasks = '/tasks';
  static const taskCreate = '/tasks/create';
  static String taskDetail(String id) => '/tasks/$id';
  static String taskEdit(String id) => '/tasks/$id/edit';
  static String taskHistory(String id) => '/tasks/$id/history';
}

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter createRouter(AuthBloc authBloc) {
  return GoRouter(
    refreshListenable: _GoRouterRefreshStream(authBloc.stream),
    initialLocation: AppRoutes.projects,
    redirect: (context, state) {
      final authState = authBloc.state;

      if (authState is AuthInitial || authState is AuthLoading) return null;

      final isAuthenticated = authState is AuthAuthenticated;
      final isSessionExpired = authState is AuthStateSessionExpired;
      final isOnLogin = state.matchedLocation == AppRoutes.login;

      if ((!isAuthenticated || isSessionExpired) && !isOnLogin) return AppRoutes.login;
      if (isAuthenticated && isOnLogin) return AppRoutes.projects;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (_, _) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.projects,
        builder: (_, _) => const ProjectListPage(),
        routes: [
          GoRoute(
            path: 'create',
            builder: (_, _) => const ProjectFormPage(),
          ),
          GoRoute(
            path: 'none/tasks',
            builder: (_, _) => const TaskListPage(
              semProjeto: true,
              projetoNome: 'Sem projeto',
            ),
          ),
          GoRoute(
            path: ':id/edit',
            builder: (_, state) =>
                ProjectFormPage(initialProject: state.extra as Project?),
          ),
          GoRoute(
            path: ':id/tasks',
            builder: (_, state) {
              final project = state.extra as Project?;
              return TaskListPage(
                projetoId: state.pathParameters['id'],
                projetoNome: project?.nome,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.tasks,
        builder: (_, _) => const TaskListPage(),
        routes: [
          GoRoute(
            path: 'create',
            builder: (_, state) => TaskFormPage(
              projetoId: state.extra is String ? state.extra as String : null,
            ),
          ),
          GoRoute(
            path: ':id',
            builder: (_, state) => TaskDetailPage(
              taskId: state.pathParameters['id']!,
            ),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (_, state) => TaskFormPage(
                  initialTask: state.extra as Task?,
                ),
              ),
              GoRoute(
                path: 'history',
                builder: (_, state) => TaskHistoryPage(
                  taskId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
