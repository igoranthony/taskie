import '../entities/task.dart';
import '../entities/task_history.dart';

abstract class TaskRepository {
  Future<({List<Task> tasks, bool hasNext})> getTasks({
    int page,
    TaskStatus? filterStatus,
    TaskPriority? filterPrioridade,
    String? filterSearch,
    int? filterCriadoPor,
    int? filterAtribuidoPara,
    DateTime? filterCriadoEmInicio,
    DateTime? filterCriadoEmFim,
    DateTime? filterDataLimiteInicio,
    DateTime? filterDataLimiteFim,
  });
  Future<Task> getTaskById(String id);
  Future<Task> createTask(Task task);
  Future<Task> updateTask(Task task);
  Future<void> deleteTask(String id);
  Future<List<TaskHistory>> getTaskHistory(String taskId);
}