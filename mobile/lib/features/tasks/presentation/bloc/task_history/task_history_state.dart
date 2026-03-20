import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task_history.dart';

part 'task_history_state.freezed.dart';

@freezed
class TaskHistoryState with _$TaskHistoryState {
  const factory TaskHistoryState.initial() = TaskHistoryInitial;
  const factory TaskHistoryState.loading() = TaskHistoryLoading;
  const factory TaskHistoryState.success(List<TaskHistory> history) =
      TaskHistorySuccess;
  const factory TaskHistoryState.failure(String message) = TaskHistoryFailure;
}
