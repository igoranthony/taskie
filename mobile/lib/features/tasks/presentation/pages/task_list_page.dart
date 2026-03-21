import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../authentication/presentation/cubit/users_cubit.dart';
import '../bloc/task_list/task_list_bloc.dart';
import '../bloc/task_list/task_list_event.dart';
import '../bloc/task_list/task_list_state.dart';
import '../widgets/list/task_list_header.dart';
import '../widgets/list/task_list_content.dart';
import '../widgets/list/task_filter_tabs.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TaskListBloc(
            getTasks: getIt<GetTasks>(),
            deleteTask: getIt<DeleteTask>(),
          )..add(const TaskListEvent.loaded()),
        ),
        BlocProvider(
          create: (_) => getIt<UsersCubit>()..loadUsers(),
        ),
      ],
      child: const _TaskListView(),
    );
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TaskListHeader(),
            const SizedBox(height: 16),
            BlocBuilder<TaskListBloc, TaskListState>(
              buildWhen: (_, curr) => curr is TaskListSuccess,
              builder: (context, state) => TaskFilterTabs(
                currentFilter:
                    state is TaskListSuccess ? state.filterStatus : null,
                onFilterChanged: (status) => context
                    .read<TaskListBloc>()
                    .add(TaskListEvent.filtered(status: status)),
              ),
            ),
            const SizedBox(height: 8),
            const Expanded(child: TaskListContent()),
          ],
        ),
      ),
    );
  }
}
