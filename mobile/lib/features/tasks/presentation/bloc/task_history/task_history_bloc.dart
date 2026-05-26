import 'package:taskie/core/errors/app_error_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_task_history.dart';
import 'task_history_event.dart';
import 'task_history_state.dart';

class TaskHistoryBloc extends Bloc<TaskHistoryEvent, TaskHistoryState> {
  final GetTaskHistory _getTaskHistory;

  TaskHistoryBloc({required GetTaskHistory getTaskHistory})
      : _getTaskHistory = getTaskHistory,
        super(const TaskHistoryState.initial()) {
    on<TaskHistoryLoaded>(_onLoaded);
  }

  Future<void> _onLoaded(
    TaskHistoryLoaded event,
    Emitter<TaskHistoryState> emit,
  ) async {
    emit(const TaskHistoryState.loading());
    try {
      final history = await _getTaskHistory(event.taskId);
      emit(TaskHistoryState.success(history));
    } catch (e) {
      emit(TaskHistoryState.failure(AppErrorParser.parse(e)));
    }
  }
}
