import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/repositories/task_repository.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_task_history.dart';
import '../bloc/task_detail/task_detail_bloc.dart';
import '../bloc/task_detail/task_detail_event.dart';
import '../bloc/task_detail/task_detail_state.dart';
import '../bloc/task_history/task_history_bloc.dart';
import '../bloc/task_history/task_history_event.dart';
import '../bloc/task_history/task_history_state.dart';
import '../widgets/detail/task_detail_header.dart';
import '../widgets/detail/task_detail_tabs.dart';
import '../widgets/detail/task_overview_tab.dart';
import '../widgets/detail/task_history_tab.dart';
import '../../../../shared/widgets/app_snackbar.dart';
import '../../../../shared/widgets/confirm_dialog.dart';

class TaskDetailPage extends StatefulWidget {
  final String taskId;

  const TaskDetailPage({super.key, required this.taskId});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  int _activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TaskDetailBloc(
            taskRepository: getIt<TaskRepository>(),
          )..add(TaskDetailEvent.loaded(widget.taskId)),
        ),
        BlocProvider(
          create: (_) => TaskHistoryBloc(
            getTaskHistory: getIt<GetTaskHistory>(),
          )..add(TaskHistoryEvent.loaded(widget.taskId)),
        ),
      ],
      child: _TaskDetailView(
        taskId: widget.taskId,
        activeTab: _activeTab,
        onTabChanged: (i) => setState(() => _activeTab = i),
      ),
    );
  }
}

class _TaskDetailView extends StatelessWidget {
  final String taskId;
  final int activeTab;
  final ValueChanged<int> onTabChanged;

  const _TaskDetailView({
    required this.taskId,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: BlocBuilder<TaskDetailBloc, TaskDetailState>(
                builder: (context, state) {
                  final task =
                      state is TaskDetailSuccess ? state.task : null;
                  return TaskDetailHeader(
                    taskId: taskId,
                    onEdit: (task == null || !task.canEdit)
                        ? null
                        : () async {
                            final updated = await context.push(
                              AppRoutes.taskEdit(taskId),
                              extra: task,
                            );
                            if (updated != null && context.mounted) {
                              context
                                  .read<TaskDetailBloc>()
                                  .add(const TaskDetailEvent.refreshed());
                              context
                                  .read<TaskHistoryBloc>()
                                  .add(TaskHistoryEvent.loaded(taskId));
                            }
                          },
                    onDelete: (task == null || !task.canEdit)
                        ? null
                        : () => _confirmDelete(context),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<TaskHistoryBloc, TaskHistoryState>(
                builder: (context, histState) {
                  final count = histState is TaskHistorySuccess
                      ? histState.history.length
                      : null;
                  return TaskDetailSegmentedTabs(
                    activeIndex: activeTab,
                    historyCount: count,
                    onChanged: onTabChanged,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: activeTab == 0
                  ? TaskOverviewTab(taskId: taskId)
                  : TaskHistoryTab(taskId: taskId),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await ConfirmDialog.show(
      context,
      title: 'Excluir tarefa',
      message: 'Tem certeza que deseja excluir esta tarefa?',
      confirmLabel: 'Excluir',
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;
    try {
      await getIt<DeleteTask>().call(taskId);
      if (context.mounted) context.pop(true);
    } catch (_) {
      if (context.mounted) {
        AppSnackbar.error(context, 'Erro ao excluir a tarefa.');
      }
    }
  }
}
