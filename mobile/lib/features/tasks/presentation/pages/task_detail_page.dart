import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../bloc/task_detail/task_detail_bloc.dart';
import '../bloc/task_detail/task_detail_event.dart';
import '../bloc/task_detail/task_detail_state.dart';
import '../widgets/task_status_badge.dart';
import '../widgets/task_priority_badge.dart';
import '../../../../shared/widgets/app_page.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_icon_button.dart';
import '../../../../shared/extensions/datetime_extensions.dart';

class TaskDetailPage extends StatelessWidget {
  final String taskId;

  const TaskDetailPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskDetailBloc(
        taskRepository: getIt<TaskRepository>(),
      )..add(TaskDetailEvent.loaded(taskId)),
      child: _TaskDetailView(taskId: taskId),
    );
  }
}

class _TaskDetailView extends StatelessWidget {
  final String taskId;

  const _TaskDetailView({required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailBloc, TaskDetailState>(
      builder: (context, state) {
        final actions = state.whenOrNull(
          success: (task) => [
            AppIconButton(
              icon: Icons.history,
              semanticLabel: 'Ver histórico de alterações',
              tooltip: 'Histórico',
              onPressed: () => context.push(AppRoutes.taskHistory(taskId)),
            ),
            AppIconButton(
              icon: Icons.edit,
              semanticLabel: 'Editar tarefa',
              tooltip: 'Editar',
              onPressed: () async {
                final updated = await context.push(
                  AppRoutes.taskEdit(taskId),
                  extra: task,
                );
                if (updated != null && context.mounted) {
                  context
                      .read<TaskDetailBloc>()
                      .add(const TaskDetailEvent.refreshed());
                }
              },
            ),
          ],
        );

        return AppPage(
          title: 'Detalhes da Tarefa',
          actions: actions,
          body: state.when(
            initial: () => const AppLoading(),
            loading: () => const AppLoading(),
            success: (task) => _TaskDetailBody(task: task),
            failure: (message) => AppErrorWidget(
              error: message,
              message: 'Erro ao carregar tarefa',
              onRetry: () => context
                  .read<TaskDetailBloc>()
                  .add(TaskDetailEvent.loaded(taskId)),
            ),
          ),
        );
      },
    );
  }
}

class _TaskDetailBody extends StatelessWidget {
  final Task task;

  const _TaskDetailBody({required this.task});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TaskStatusBadge(status: task.status),
              const SizedBox(width: 8),
              TaskPriorityBadge(
                prioridade: task.prioridade,
                style: TaskPriorityBadgeStyle.chip,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            task.titulo,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (task.descricao != null && task.descricao!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              task.descricao!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          _InfoRow(
            icon: Icons.person_outline,
            label: 'Criado por',
            value: task.criadoPor,
          ),
          if (task.atribuidoPara != null) ...[
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.assignment_ind_outlined,
              label: 'Atribuído para',
              value: task.atribuidoPara!,
            ),
          ],
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Criado em',
            value: task.criadoEm.toDateBR(),
          ),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.update_outlined,
            label: 'Atualizado em',
            value: task.atualizadoEm.toDateBR(),
          ),
          if (task.dataLimite != null) ...[
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.event_outlined,
              label: 'Data limite',
              value: task.dataLimite!.toDateBR(),
              valueColor: task.dataLimite!.isBefore(DateTime.now()) &&
                      task.status != TaskStatus.concluido
                  ? cs.error
                  : null,
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 20, color: cs.onSurfaceVariant),
        const SizedBox(width: 8),
        Text('$label: ', style: TextStyle(color: cs.onSurfaceVariant)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w500, color: valueColor),
          ),
        ),
      ],
    );
  }
}
