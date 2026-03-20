import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_detail_event.freezed.dart';

@freezed
class TaskDetailEvent with _$TaskDetailEvent {
  const factory TaskDetailEvent.loaded(String taskId) = TaskDetailLoaded;
  const factory TaskDetailEvent.refreshed() = TaskDetailRefreshed;
}
