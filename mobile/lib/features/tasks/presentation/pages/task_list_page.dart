import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import '../../../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../../../../features/authentication/presentation/bloc/auth_event.dart';
import '../bloc/task_list/task_list_bloc.dart';
import '../bloc/task_list/task_list_event.dart';
import '../bloc/task_list/task_list_state.dart';
import '../widgets/task_card.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../../../../shared/widgets/app_page.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_empty_state.dart';
import '../../../../shared/widgets/confirm_dialog.dart';
import '../../../../shared/widgets/app_icon_button.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskListBloc(
        getTasks: getIt<GetTasks>(),
        deleteTask: getIt<DeleteTask>(),
      )..add(const TaskListEvent.loaded()),
      child: const _TaskListView(),
    );
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView();

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Tarefas',
      actions: [
        AppIconButton(
          icon: Icons.filter_list,
          semanticLabel: 'Filtrar tarefas por status',
          tooltip: 'Filtrar tarefas',
          onPressed: () => _showFilterBottomSheet(context),
        ),
        AppIconButton(
          icon: Icons.logout,
          semanticLabel: 'Sair da conta',
          tooltip: 'Sair',
          onPressed: () =>
              context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
        ),
      ],
      floatingActionButton: Semantics(
        label: 'Criar nova tarefa',
        hint: 'Toque para abrir o formulário de criação',
        child: FloatingActionButton(
          onPressed: () async {
            await context.push(AppRoutes.taskCreate);
            if (context.mounted) {
              context.read<TaskListBloc>().add(const TaskListEvent.refreshed());
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: BlocBuilder<TaskListBloc, TaskListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const AppLoading(),
            loading: () => const AppLoading(),
            success: (tasks, _) => RefreshIndicator(
              onRefresh: () async =>
                  context.read<TaskListBloc>().add(const TaskListEvent.refreshed()),
              child: tasks.isEmpty
                  ? const AppEmptyState(
                      icon: Icons.task_alt,
                      title: 'Nenhuma tarefa encontrada',
                      subtitle: 'Toque no + para criar uma nova tarefa',
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return TaskCard(
                          task: task,
                          onTap: () async {
                            await context.push(AppRoutes.taskDetail(task.id));
                            if (context.mounted) {
                              context
                                  .read<TaskListBloc>()
                                  .add(const TaskListEvent.refreshed());
                            }
                          },
                          onDelete: () => _confirmDelete(context, task.id),
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
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    final bloc = context.read<TaskListBloc>();
    final currentFilter =
        bloc.state is TaskListSuccess ? (bloc.state as TaskListSuccess).filterStatus : null;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => FilterBottomSheet(
        currentFilter: currentFilter,
        onFilterChanged: (status) {
          bloc.add(TaskListEvent.filtered(status: status));
        },
      ),
    );
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
