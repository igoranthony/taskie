import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task.dart';

part 'task_list_event.freezed.dart';

@freezed
class TaskListEvent with _$TaskListEvent {
  const factory TaskListEvent.loaded() = TaskListLoaded;
  const factory TaskListEvent.refreshed() = TaskListRefreshed;
  const factory TaskListEvent.filtered({
    TaskStatus? status,
    TaskPriority? prioridade,
    String? search,
    int? criadoPor,
    int? atribuidoPara,
    DateTime? criadoEmInicio,
    DateTime? criadoEmFim,
    DateTime? dataLimiteInicio,
    DateTime? dataLimiteFim,
    String? projetoId,
    String? colunaId,
    @Default(false) bool semProjeto,
  }) = TaskListFiltered;
  const factory TaskListEvent.loadedMore() = TaskListLoadedMore;
  const factory TaskListEvent.taskDeleted(String id) = TaskListTaskDeleted;
  const factory TaskListEvent.taskUpdated(Task task) = TaskListTaskUpdated;
}
