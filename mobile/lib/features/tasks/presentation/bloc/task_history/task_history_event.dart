import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_history_event.freezed.dart';

@freezed
class TaskHistoryEvent with _$TaskHistoryEvent {
  const factory TaskHistoryEvent.loaded(String taskId) = TaskHistoryLoaded;
}
