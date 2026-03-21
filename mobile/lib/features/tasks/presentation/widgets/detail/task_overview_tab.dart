import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/task_detail/task_detail_bloc.dart';
import '../../bloc/task_detail/task_detail_event.dart';
import '../../bloc/task_detail/task_detail_state.dart';
import 'task_detail_overview.dart';
import 'task_detail_skeleton.dart';
import '../../../../../shared/widgets/app_error_widget.dart';

class TaskOverviewTab extends StatelessWidget {
  final String taskId;

  const TaskOverviewTab({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailBloc, TaskDetailState>(
      builder: (context, state) => state.when(
        initial: () => const TaskDetailSkeleton(),
        loading: () => const TaskDetailSkeleton(),
        success: (task) => TaskDetailOverviewBody(task: task),
        failure: (message) => AppErrorWidget(
          error: message,
          message: 'Erro ao carregar tarefa',
          onRetry: () => context
              .read<TaskDetailBloc>()
              .add(TaskDetailEvent.loaded(taskId)),
        ),
      ),
    );
  }
}
