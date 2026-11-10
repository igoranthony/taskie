import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_detail_event.freezed.dart';

@freezed
class TaskDetailEvent with _$TaskDetailEvent {
  const factory TaskDetailEvent.loaded(String taskId) = TaskDetailLoaded;
  const factory TaskDetailEvent.refreshed() = TaskDetailRefreshed;

  const factory TaskDetailEvent.subtaskAdded(String titulo) =
      TaskDetailSubtaskAdded;
  const factory TaskDetailEvent.subtaskToggled(String subtaskId) =
      TaskDetailSubtaskToggled;
  const factory TaskDetailEvent.subtaskDeleted(String subtaskId) =
      TaskDetailSubtaskDeleted;

  const factory TaskDetailEvent.attachmentUploaded(File arquivo) =
      TaskDetailAttachmentUploaded;
  const factory TaskDetailEvent.attachmentDeleted(String attachmentId) =
      TaskDetailAttachmentDeleted;
}
