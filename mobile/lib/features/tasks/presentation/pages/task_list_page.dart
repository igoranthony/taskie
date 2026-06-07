import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../authentication/presentation/cubit/users_cubit.dart';
import '../../../projects/domain/entities/project_column.dart';
import '../../../projects/domain/usecases/get_project_columns.dart';
import '../../../projects/presentation/cubit/project_columns_cubit.dart';
import '../../../projects/presentation/cubit/project_columns_state.dart';
import '../bloc/task_list/task_list_bloc.dart';
import '../bloc/task_list/task_list_event.dart';
import '../bloc/task_list/task_list_state.dart';
import '../widgets/list/task_list_header.dart';
import '../widgets/list/task_list_content.dart';
import '../widgets/list/task_filter_tabs.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';

class TaskListPage extends StatelessWidget {
  /// Quando definido, a página é aberta no contexto de um projeto e
  /// só lista tasks daquele projeto.
  final String? projetoId;

  /// Quando true, lista somente tasks sem projeto.
  final bool semProjeto;

  /// Nome amigável para o header (projeto selecionado ou "Sem projeto").
  final String? projetoNome;

  const TaskListPage({
    super.key,
    this.projetoId,
    this.semProjeto = false,
    this.projetoNome,
  });

  bool get _inProjectContext => projetoId != null || semProjeto;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final bloc = TaskListBloc(
              getTasks: getIt<GetTasks>(),
              deleteTask: getIt<DeleteTask>(),
            );
            if (_inProjectContext) {
              bloc.add(TaskListEvent.filtered(
                projetoId: projetoId,
                semProjeto: semProjeto,
              ));
            } else {
              bloc.add(const TaskListEvent.loaded());
            }
            return bloc;
          },
        ),
        BlocProvider(
          create: (_) => getIt<UsersCubit>()..loadUsers(),
        ),
        // Disponibiliza o cubit de colunas somente quando há projeto
        // selecionado — assim o long-press abre o picker de coluna.
        if (projetoId != null)
          BlocProvider(
            create: (_) =>
                ProjectColumnsCubit(getIt<GetProjectColumns>())..load(projetoId!),
          ),
      ],
      child: _TaskListView(
        projetoId: projetoId,
        semProjeto: semProjeto,
        projetoNome: projetoNome,
      ),
    );
  }
}

class _TaskListView extends StatelessWidget {
  final String? projetoId;
  final bool semProjeto;
  final String? projetoNome;

  const _TaskListView({
    required this.projetoId,
    required this.semProjeto,
    required this.projetoNome,
  });

  bool get _inProjectContext => projetoId != null || semProjeto;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskListHeader(
              projectName: _inProjectContext ? projetoNome : null,
              showBack: _inProjectContext,
            ),
            const SizedBox(height: 16),
            BlocBuilder<TaskListBloc, TaskListState>(
              buildWhen: (_, curr) => curr is TaskListSuccess,
              builder: (context, state) {
                final success = state is TaskListSuccess ? state : null;
                if (projetoId == null) {
                  return _buildFilterTabs(context, success, null);
                }
                return BlocBuilder<ProjectColumnsCubit, ProjectColumnsState>(
                  builder: (context, columnsState) {
                    final columns = columnsState is ProjectColumnsLoaded
                        ? columnsState.columns
                        : const <ProjectColumn>[];
                    return _buildFilterTabs(context, success, columns);
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            const Expanded(child: TaskListContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs(
    BuildContext context,
    TaskListSuccess? state,
    List<ProjectColumn>? projectColumns,
  ) {
    return TaskFilterTabs(
      currentFilter: state?.filterStatus,
      currentColumnId: state?.colunaId,
      projectColumns: projectColumns,
      onFilterChanged: (status) => context.read<TaskListBloc>().add(
            _filteredEvent(state, status: status),
          ),
      onColumnChanged: (colunaId) => context.read<TaskListBloc>().add(
            _filteredEvent(state, colunaId: colunaId),
          ),
    );
  }

  TaskListEvent _filteredEvent(
    TaskListSuccess? state, {
    TaskStatus? status,
    String? colunaId,
  }) {
    return TaskListEvent.filtered(
      status: status,
      prioridade: state?.filterPrioridade,
      search: state?.filterSearch,
      criadoPor: state?.filterCriadoPor,
      atribuidoPara: state?.filterAtribuidoPara,
      criadoEmInicio: state?.filterCriadoEmInicio,
      criadoEmFim: state?.filterCriadoEmFim,
      dataLimiteInicio: state?.filterDataLimiteInicio,
      dataLimiteFim: state?.filterDataLimiteFim,
      projetoId: projetoId,
      colunaId: colunaId,
      semProjeto: semProjeto,
    );
  }
}
