import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/router/app_router.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/usecases/update_task.dart';
import '../../bloc/task_list/task_list_bloc.dart';
import '../../bloc/task_list/task_list_event.dart';
import '../../bloc/task_list/task_list_state.dart';
import 'task_card.dart';
import 'task_list_skeleton.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/app_empty_state.dart';
import '../../../../../shared/widgets/app_snackbar.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';

class TaskListContent extends StatelessWidget {
  const TaskListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) => state.when(
        initial: () => const TaskListSkeleton(),
        loading: () => const TaskListSkeleton(),
        success: (tasks, status, prioridade, search, criadoPor, atribuidoPara, criadoEmInicio, criadoEmFim, dataLimiteInicio, dataLimiteFim) => RefreshIndicator(
          onRefresh: () async =>
              context.read<TaskListBloc>().add(const TaskListEvent.refreshed()),
          child: tasks.isEmpty
              ? const AppEmptyState(
                  icon: Icons.task_alt,
                  title: 'Nenhuma tarefa encontrada',
                  subtitle: 'Toque em + para criar uma nova tarefa',
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskCard(
                      task: task,
                      onTap: () async {
                        final changed = await context.push(AppRoutes.taskDetail(task.id));
                        if (changed == true && context.mounted) {
                          context
                              .read<TaskListBloc>()
                              .add(const TaskListEvent.refreshed());
                        }
                      },
                      onDelete: task.canEdit
                          ? () => _confirmDelete(context, task.id)
                          : null,
                      onStatusChange: task.canEdit
                          ? (newStatus) =>
                              _changeStatus(context, task, newStatus)
                          : null,
                      onStatusChangeDenied: task.canEdit
                          ? null
                          : () => AppSnackbar.info(
                                context,
                                'Somente o criador pode alterar o status desta tarefa.',
                              ),
                    );
                  },
                ),
        ),
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar tarefas',
          onRetry: () =>
              context.read<TaskListBloc>().add(const TaskListEvent.loaded()),
        ),
      ),
    );
  }

  Future<void> _changeStatus(
      BuildContext context, Task task, TaskStatus newStatus) async {
    try {
      await getIt<UpdateTask>().call(task.copyWith(status: newStatus));
      if (context.mounted) {
        context.read<TaskListBloc>().add(const TaskListEvent.refreshed());
      }
    } catch (_) {
      if (context.mounted) {
        AppSnackbar.error(context, 'Erro ao atualizar status.');
      }
    }
  }

  Future<void> _confirmDelete(BuildContext context, String taskId) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Excluir tarefa',
      message: 'Tem certeza que deseja excluir esta tarefa?',
      confirmLabel: 'Excluir',
      destructive: true,
    );
    if (confirmed && context.mounted) {
      context.read<TaskListBloc>().add(TaskListEvent.taskDeleted(taskId));
    }
  }
}
