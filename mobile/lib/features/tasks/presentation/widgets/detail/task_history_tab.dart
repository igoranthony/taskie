import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/task_history/task_history_bloc.dart';
import '../../bloc/task_history/task_history_event.dart';
import '../../bloc/task_history/task_history_state.dart';
import 'history_item.dart';
import '../../../../../shared/widgets/app_loading.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/app_empty_state.dart';

class TaskHistoryTab extends StatelessWidget {
  final String taskId;

  const TaskHistoryTab({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskHistoryBloc, TaskHistoryState>(
      builder: (context, state) => state.when(
        initial: () => const AppLoading(),
        loading: () => const AppLoading(),
        success: (history) => history.isEmpty
            ? const AppEmptyState(
                icon: Icons.history,
                title: 'Nenhuma alteração registrada',
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                itemCount: history.length,
                itemBuilder: (context, index) => HistoryItem(
                  history: history[index],
                  isLast: index == history.length - 1,
                ),
              ),
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar histórico',
          onRetry: () => context
              .read<TaskHistoryBloc>()
              .add(TaskHistoryEvent.loaded(taskId)),
        ),
      ),
    );
  }
}
