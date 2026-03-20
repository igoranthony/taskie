import '../entities/task.dart';
import '../entities/task_history.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks({TaskStatus? filterStatus});
  Future<Task> getTaskById(String id);
  Future<Task> createTask(Task task);
  Future<Task> updateTask(Task task);
  Future<void> deleteTask(String id);
  Future<List<TaskHistory>> getTaskHistory(String taskId);
}