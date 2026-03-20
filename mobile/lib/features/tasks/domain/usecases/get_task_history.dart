import '../entities/task_history.dart';
import '../repositories/task_repository.dart';

class GetTaskHistory {
  final TaskRepository repository;

  GetTaskHistory(this.repository);

  Future<List<TaskHistory>> call(String taskId) {
    return repository.getTaskHistory(taskId);
  }
}