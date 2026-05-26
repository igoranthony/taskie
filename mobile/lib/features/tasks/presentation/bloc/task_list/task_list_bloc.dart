import 'package:taskie/core/errors/app_error_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_tasks.dart';
import '../../../domain/usecases/delete_task.dart';
import 'task_list_event.dart';
import 'task_list_state.dart';

class TaskListBloc extends Bloc<TaskListEvent, TaskListState> {
  final GetTasks _getTasks;
  final DeleteTask _deleteTask;

  TaskListBloc({
    required GetTasks getTasks,
    required DeleteTask deleteTask,
  })  : _getTasks = getTasks,
        _deleteTask = deleteTask,
        super(const TaskListState.initial()) {
    on<TaskListLoaded>(_onLoaded);
    on<TaskListRefreshed>(_onRefreshed);
    on<TaskListFiltered>(_onFiltered);
    on<TaskListLoadedMore>(_onLoadedMore);
    on<TaskListTaskDeleted>(_onTaskDeleted);
    on<TaskListTaskUpdated>(_onTaskUpdated);
  }

  Future<void> _onLoaded(
    TaskListLoaded event,
    Emitter<TaskListState> emit,
  ) async {
    emit(const TaskListState.loading());
    try {
      final result = await _getTasks();
      emit(TaskListState.success(
        tasks: result.tasks,
        hasReachedMax: !result.hasNext,
      ));
    } catch (e) {
      emit(TaskListState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onRefreshed(
    TaskListRefreshed event,
    Emitter<TaskListState> emit,
  ) async {
    final current = state is TaskListSuccess ? state as TaskListSuccess : null;
    emit(const TaskListState.loading());
    try {
      final result = await _getTasks(
        status: current?.filterStatus,
        prioridade: current?.filterPrioridade,
        search: current?.filterSearch,
        criadoPor: current?.filterCriadoPor,
        atribuidoPara: current?.filterAtribuidoPara,
        criadoEmInicio: current?.filterCriadoEmInicio,
        criadoEmFim: current?.filterCriadoEmFim,
        dataLimiteInicio: current?.filterDataLimiteInicio,
        dataLimiteFim: current?.filterDataLimiteFim,
      );
      emit(TaskListState.success(
        tasks: result.tasks,
        hasReachedMax: !result.hasNext,
        filterStatus: current?.filterStatus,
        filterPrioridade: current?.filterPrioridade,
        filterSearch: current?.filterSearch,
        filterCriadoPor: current?.filterCriadoPor,
        filterAtribuidoPara: current?.filterAtribuidoPara,
        filterCriadoEmInicio: current?.filterCriadoEmInicio,
        filterCriadoEmFim: current?.filterCriadoEmFim,
        filterDataLimiteInicio: current?.filterDataLimiteInicio,
        filterDataLimiteFim: current?.filterDataLimiteFim,
      ));
    } catch (e) {
      emit(TaskListState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onFiltered(
    TaskListFiltered event,
    Emitter<TaskListState> emit,
  ) async {
    emit(const TaskListState.loading());
    try {
      final result = await _getTasks(
        status: event.status,
        prioridade: event.prioridade,
        search: event.search,
        criadoPor: event.criadoPor,
        atribuidoPara: event.atribuidoPara,
        criadoEmInicio: event.criadoEmInicio,
        criadoEmFim: event.criadoEmFim,
        dataLimiteInicio: event.dataLimiteInicio,
        dataLimiteFim: event.dataLimiteFim,
      );
      emit(TaskListState.success(
        tasks: result.tasks,
        hasReachedMax: !result.hasNext,
        filterStatus: event.status,
        filterPrioridade: event.prioridade,
        filterSearch: event.search,
        filterCriadoPor: event.criadoPor,
        filterAtribuidoPara: event.atribuidoPara,
        filterCriadoEmInicio: event.criadoEmInicio,
        filterCriadoEmFim: event.criadoEmFim,
        filterDataLimiteInicio: event.dataLimiteInicio,
        filterDataLimiteFim: event.dataLimiteFim,
      ));
    } catch (e) {
      emit(TaskListState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onLoadedMore(
    TaskListLoadedMore event,
    Emitter<TaskListState> emit,
  ) async {
    final current = state is TaskListSuccess ? state as TaskListSuccess : null;
    if (current == null || current.hasReachedMax || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    try {
      final nextPage = current.page + 1;
      final result = await _getTasks(
        page: nextPage,
        status: current.filterStatus,
        prioridade: current.filterPrioridade,
        search: current.filterSearch,
        criadoPor: current.filterCriadoPor,
        atribuidoPara: current.filterAtribuidoPara,
        criadoEmInicio: current.filterCriadoEmInicio,
        criadoEmFim: current.filterCriadoEmFim,
        dataLimiteInicio: current.filterDataLimiteInicio,
        dataLimiteFim: current.filterDataLimiteFim,
      );
      emit(current.copyWith(
        tasks: [...current.tasks, ...result.tasks],
        page: nextPage,
        hasReachedMax: !result.hasNext,
        isLoadingMore: false,
      ));
    } catch (e) {
      emit(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> _onTaskDeleted(
    TaskListTaskDeleted event,
    Emitter<TaskListState> emit,
  ) async {
    try {
      await _deleteTask(event.id);
      add(const TaskListEvent.refreshed());
    } catch (e) {
      emit(TaskListState.failure(AppErrorParser.parse(e)));
    }
  }

  void _onTaskUpdated(
    TaskListTaskUpdated event,
    Emitter<TaskListState> emit,
  ) {
    final current = state is TaskListSuccess ? state as TaskListSuccess : null;
    if (current == null) return;
    emit(current.copyWith(
      tasks: current.tasks
          .map((t) => t.id == event.task.id ? event.task : t)
          .toList(),
    ));
  }
}
