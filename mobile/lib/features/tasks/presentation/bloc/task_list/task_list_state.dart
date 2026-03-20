import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task.dart';

part 'task_list_state.freezed.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState.initial() = TaskListInitial;
  const factory TaskListState.loading() = TaskListLoading;
  const factory TaskListState.success({
    required List<Task> tasks,
    TaskStatus? filterStatus,
  }) = TaskListSuccess;
  const factory TaskListState.failure(String message) = TaskListFailure;
}
