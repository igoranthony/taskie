import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/usecases/get_task_history.dart';
import '../bloc/task_history/task_history_bloc.dart';
import '../bloc/task_history/task_history_event.dart';
import '../bloc/task_history/task_history_state.dart';
import '../widgets/history_item.dart';
import '../../../../shared/widgets/app_page.dart';
import '../../../../shared/widgets/app_loading.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_empty_state.dart';

class TaskHistoryPage extends StatelessWidget {
  final String taskId;

  const TaskHistoryPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskHistoryBloc(
        getTaskHistory: getIt<GetTaskHistory>(),
      )..add(TaskHistoryEvent.loaded(taskId)),
      child: _TaskHistoryView(taskId: taskId),
    );
  }
}

class _TaskHistoryView extends StatelessWidget {
  final String taskId;

  const _TaskHistoryView({required this.taskId});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Histórico de Alterações',
      body: BlocBuilder<TaskHistoryBloc, TaskHistoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const AppLoading(),
            loading: () => const AppLoading(),
            success: (history) => history.isEmpty
                ? const AppEmptyState(
                    icon: Icons.history,
                    title: 'Nenhuma alteração registrada',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: history.length,
                    itemBuilder: (context, index) =>
                        HistoryItem(history: history[index]),
                  ),
            failure: (message) => AppErrorWidget(
              error: message,
              message: 'Erro ao carregar histórico',
              onRetry: () => context
                  .read<TaskHistoryBloc>()
                  .add(TaskHistoryEvent.loaded(taskId)),
            ),
          );
        },
      ),
    );
  }
}
