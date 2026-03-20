import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/task_repository.dart';
import 'task_detail_event.dart';
import 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  final TaskRepository _taskRepository;
  String? _taskId;

  TaskDetailBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(const TaskDetailState.initial()) {
    on<TaskDetailLoaded>(_onLoaded);
    on<TaskDetailRefreshed>(_onRefreshed);
  }

  Future<void> _onLoaded(
    TaskDetailLoaded event,
    Emitter<TaskDetailState> emit,
  ) async {
    _taskId = event.taskId;
    emit(const TaskDetailState.loading());
    try {
      final task = await _taskRepository.getTaskById(event.taskId);
      emit(TaskDetailState.success(task));
    } catch (e) {
      emit(TaskDetailState.failure(e.toString()));
    }
  }

  Future<void> _onRefreshed(
    TaskDetailRefreshed event,
    Emitter<TaskDetailState> emit,
  ) async {
    if (_taskId == null) return;
    emit(const TaskDetailState.loading());
    try {
      final task = await _taskRepository.getTaskById(_taskId!);
      emit(TaskDetailState.success(task));
    } catch (e) {
      emit(TaskDetailState.failure(e.toString()));
    }
  }
}
