import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../features/authentication/presentation/bloc/auth_state.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/tasks/domain/entities/task.dart';
import '../../features/tasks/presentation/pages/task_list_page.dart';
import '../../features/tasks/presentation/pages/task_detail_page.dart';
import '../../features/tasks/presentation/pages/task_form_page.dart';
import '../../features/tasks/presentation/pages/task_history_page.dart';

abstract class AppRoutes {
  static const login = '/login';
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
    initialLocation: AppRoutes.tasks,
    redirect: (context, state) {
      final authState = authBloc.state;

      if (authState is AuthInitial || authState is AuthLoading) return null;

      final isAuthenticated = authState is AuthAuthenticated;
      final isSessionExpired = authState is AuthStateSessionExpired;
      final isOnLogin = state.matchedLocation == AppRoutes.login;

      if ((!isAuthenticated || isSessionExpired) && !isOnLogin) return AppRoutes.login;
      if (isAuthenticated && isOnLogin) return AppRoutes.tasks;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.tasks,
        builder: (_, __) => const TaskListPage(),
        routes: [
          GoRoute(
            path: 'create',
            builder: (_, __) => const TaskFormPage(),
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
