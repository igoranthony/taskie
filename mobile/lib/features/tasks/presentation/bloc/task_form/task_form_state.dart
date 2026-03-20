import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task.dart';

part 'task_form_state.freezed.dart';

@freezed
class TaskFormState with _$TaskFormState {
  const factory TaskFormState.initial() = TaskFormInitial;
  const factory TaskFormState.loading() = TaskFormLoading;
  const factory TaskFormState.success(Task task) = TaskFormSuccess;
  const factory TaskFormState.failure(String message) = TaskFormFailure;
}
