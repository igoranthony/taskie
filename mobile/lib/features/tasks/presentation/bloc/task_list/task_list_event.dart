import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task.dart';

part 'task_list_event.freezed.dart';

@freezed
class TaskListEvent with _$TaskListEvent {
  const factory TaskListEvent.loaded() = TaskListLoaded;
  const factory TaskListEvent.refreshed() = TaskListRefreshed;
  const factory TaskListEvent.filtered({TaskStatus? status}) = TaskListFiltered;
  const factory TaskListEvent.taskDeleted(String id) = TaskListTaskDeleted;
}
