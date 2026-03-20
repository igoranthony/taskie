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
    on<TaskListTaskDeleted>(_onTaskDeleted);
  }

  Future<void> _onLoaded(
    TaskListLoaded event,
    Emitter<TaskListState> emit,
  ) async {
    emit(const TaskListState.loading());
    try {
      final tasks = await _getTasks();
      emit(TaskListState.success(tasks: tasks));
    } catch (e) {
      emit(TaskListState.failure(e.toString()));
    }
  }

  Future<void> _onRefreshed(
    TaskListRefreshed event,
    Emitter<TaskListState> emit,
  ) async {
    final currentFilter =
        state is TaskListSuccess ? (state as TaskListSuccess).filterStatus : null;
    emit(const TaskListState.loading());
    try {
      final tasks = await _getTasks(status: currentFilter);
      emit(TaskListState.success(tasks: tasks, filterStatus: currentFilter));
    } catch (e) {
      emit(TaskListState.failure(e.toString()));
    }
  }

  Future<void> _onFiltered(
    TaskListFiltered event,
    Emitter<TaskListState> emit,
  ) async {
    emit(const TaskListState.loading());
    try {
      final tasks = await _getTasks(status: event.status);
      emit(TaskListState.success(tasks: tasks, filterStatus: event.status));
    } catch (e) {
      emit(TaskListState.failure(e.toString()));
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
      emit(TaskListState.failure(e.toString()));
    }
  }
}
