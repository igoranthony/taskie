import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task.dart';

part 'task_detail_state.freezed.dart';

@freezed
class TaskDetailState with _$TaskDetailState {
  const factory TaskDetailState.initial() = TaskDetailInitial;
  const factory TaskDetailState.loading() = TaskDetailLoading;
  const factory TaskDetailState.success(Task task) = TaskDetailSuccess;
  const factory TaskDetailState.failure(String message) = TaskDetailFailure;
}
