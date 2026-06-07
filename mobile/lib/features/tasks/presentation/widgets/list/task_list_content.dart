import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../projects/domain/entities/project_column.dart';
import '../../../../projects/presentation/cubit/project_columns_cubit.dart';
import '../../../../projects/presentation/cubit/project_columns_state.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/usecases/move_task.dart';
import '../../../domain/usecases/update_task.dart';
import '../../bloc/task_list/task_list_bloc.dart';
import '../../bloc/task_list/task_list_event.dart';
import '../../bloc/task_list/task_list_state.dart';
import '../common/task_column_picker.dart';
import 'task_card.dart';
import 'task_list_skeleton.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/app_empty_state.dart';
import '../../../../../shared/widgets/app_loading.dart';
import '../../../../../shared/widgets/app_snackbar.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';

class TaskListContent extends StatefulWidget {
  const TaskListContent({super.key});

  @override
  State<TaskListContent> createState() => _TaskListContentState();
}

class _TaskListContentState extends State<TaskListContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<TaskListBloc>().add(const TaskListEvent.loadedMore());
    }
  }

  /// Devolve o cubit de colunas se existir no contexto (presente quando a tela
  /// é aberta no escopo de um projeto). Fora desse contexto, retorna `null`.
  ProjectColumnsCubit? _columnsCubit(BuildContext context) {
    try {
      return context.read<ProjectColumnsCubit>();
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) => state.when(
        initial: () => const TaskListSkeleton(),
        loading: () => const TaskListSkeleton(),
        success: (tasks, status, prioridade, search, criadoPor, atribuidoPara,
                criadoEmInicio, criadoEmFim, dataLimiteInicio, dataLimiteFim,
                projetoId, colunaId, semProjeto, page, hasReachedMax,
                isLoadingMore) =>
            RefreshIndicator(
          onRefresh: () async =>
              context.read<TaskListBloc>().add(const TaskListEvent.refreshed()),
          child: tasks.isEmpty
              ? const AppEmptyState(
                  svgAsset: 'empty.svg',
                  title: 'Nenhuma tarefa encontrada',
                  subtitle: 'Toque em + para criar uma nova tarefa',
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  itemCount: tasks.length + 1,
                  itemBuilder: (context, index) {
                    if (index == tasks.length) {
                      return _Footer(
                        isLoadingMore: isLoadingMore,
                        hasReachedMax: hasReachedMax,
                      );
                    }
                    final task = tasks[index];
                    return _TaskCardConnector(
                      task: task,
                      columnsCubit: _columnsCubit(context),
                      onChangeStatus: (newStatus) =>
                          _changeStatus(context, task, newStatus),
                      onChangeColumn: (newColumn) =>
                          _moveToColumn(context, task, newColumn),
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
      ),
    );
  }

  Future<void> _changeStatus(
      BuildContext context, Task task, TaskStatus newStatus) async {
    try {
      final updated = task.copyWith(status: newStatus);
      await getIt<UpdateTask>().call(updated);
      if (context.mounted) {
        context.read<TaskListBloc>().add(TaskListEvent.taskUpdated(updated));
        AppSnackbar.success(context, 'Status atualizado com sucesso.');
      }
    } catch (_) {
      if (context.mounted) {
        AppSnackbar.error(context, 'Erro ao atualizar status.');
      }
    }
  }

  Future<void> _moveToColumn(
      BuildContext context, Task task, ProjectColumn column) async {
    try {
      final moved = await getIt<MoveTask>().call(
        taskId: task.id,
        columnId: column.id,
        posicao: 0,
      );
      if (context.mounted) {
        context.read<TaskListBloc>().add(TaskListEvent.taskUpdated(moved));
        AppSnackbar.success(context, 'Movida para "${column.nome}".');
      }
    } catch (_) {
      if (context.mounted) {
        AppSnackbar.error(context, 'Erro ao mover a tarefa.');
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
      AppSnackbar.success(context, 'Tarefa excluída com sucesso.');
    }
  }
}

/// Encapsula a lógica de decidir qual picker abrir (status vs coluna) e
/// como apresentar o badge do card. Mantém o `TaskListContent` enxuto.
class _TaskCardConnector extends StatelessWidget {
  final Task task;
  final ProjectColumnsCubit? columnsCubit;
  final ValueChanged<TaskStatus> onChangeStatus;
  final ValueChanged<ProjectColumn> onChangeColumn;
  final VoidCallback onDelete;

  const _TaskCardConnector({
    required this.task,
    required this.columnsCubit,
    required this.onChangeStatus,
    required this.onChangeColumn,
    required this.onDelete,
  });

  bool get _inProject => task.projetoId != null && columnsCubit != null;

  @override
  Widget build(BuildContext context) {
    if (_inProject) {
      return BlocBuilder<ProjectColumnsCubit, ProjectColumnsState>(
        bloc: columnsCubit,
        builder: (_, _) => _buildCard(context),
      );
    }
    return _buildCard(context);
  }

  Widget _buildCard(BuildContext context) {
    final column = _inProject ? columnsCubit!.columnById(task.colunaId) : null;

    return TaskCard(
      task: task,
      columnLabel: column?.nome,
      columnIsDone: column?.isDoneColumn,
      onTap: () async {
        final changed = await context.push(AppRoutes.taskDetail(task.id));
        if (changed == true && context.mounted) {
          context.read<TaskListBloc>().add(const TaskListEvent.refreshed());
        }
      },
      onDelete: task.canEdit ? onDelete : null,
      onStatusChange: _buildStatusChangeHandler(context),
      onStatusChangeDenied: _buildStatusChangeDenied(context, column),
    );
  }

  /// Handler do long-press. Quando a task está num projeto, abre o picker de
  /// coluna. Caso contrário, mantém o comportamento original de status.
  ValueChanged<TaskStatus>? _buildStatusChangeHandler(BuildContext context) {
    if (!task.canEdit) return null;

    if (_inProject) {
      final state = columnsCubit!.state;
      if (state is! ProjectColumnsLoaded) return null;
      // Reaproveita o callback do long-press do TaskCard pra abrir o picker
      // de coluna. O parâmetro newStatus é ignorado.
      return (_) => TaskColumnPicker.show(
            context,
            task: task,
            columns: state.columns,
            onColumnChange: onChangeColumn,
          );
    }

    // Sem projeto: mantém a regra de "concluído irreversível"
    if (task.status == TaskStatus.concluido) return null;
    return onChangeStatus;
  }

  VoidCallback? _buildStatusChangeDenied(
      BuildContext context, ProjectColumn? column) {
    if (!task.canEdit) {
      return () => AppSnackbar.info(
            context,
            'Somente o criador pode alterar o status desta tarefa.',
          );
    }
    if (!_inProject && task.status == TaskStatus.concluido) {
      return () => AppSnackbar.info(
            context,
            'Não é possível alterar o status de uma tarefa concluída.',
          );
    }
    return null;
  }
}

class _Footer extends StatelessWidget {
  final bool isLoadingMore;
  final bool hasReachedMax;

  const _Footer({required this.isLoadingMore, required this.hasReachedMax});

  @override
  Widget build(BuildContext context) {
    if (isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: AppLoading(),
      );
    }
    if (hasReachedMax) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text(
            'Todas as tarefas carregadas',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
