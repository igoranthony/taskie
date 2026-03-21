import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../../../../features/authentication/presentation/bloc/auth_event.dart';
import '../../bloc/task_list/task_list_bloc.dart';
import '../../bloc/task_list/task_list_event.dart';

class TaskListHeader extends StatelessWidget {
  const TaskListHeader({super.key});

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
                  'TRADEX',
                  style: tt.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: cs.primary,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Gerencie suas tarefas de forma simples e eficiente',
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _HeaderAction(
            icon: Icons.add,
            onPressed: () async {
              await context.push(AppRoutes.taskCreate);
              if (context.mounted) {
                context
                    .read<TaskListBloc>()
                    .add(const TaskListEvent.refreshed());
              }
            },
          ),
          const SizedBox(width: 8),
          _HeaderAction(
            icon: Icons.logout,
            onPressed: () => context
                .read<AuthBloc>()
                .add(const AuthEvent.logoutRequested()),
          ),
        ],
      ),
    );
  }
}

class _HeaderAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderAction({required this.icon, required this.onPressed});

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
