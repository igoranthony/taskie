import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task.dart';

part 'task_form_event.freezed.dart';

@freezed
class TaskFormEvent with _$TaskFormEvent {
  const factory TaskFormEvent.submitted({
    Task? initialTask,
    required String titulo,
    String? descricao,
    required TaskStatus status,
    required TaskPriority prioridade,
    int? atribuidoPara,
    DateTime? dataLimite,
  }) = TaskFormSubmitted;
}
