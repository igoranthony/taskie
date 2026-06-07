import '../entities/task.dart';
import '../repositories/task_repository.dart';

class MoveTask {
  final TaskRepository repository;

  MoveTask(this.repository);

  Future<Task> call({
    required String taskId,
    required String columnId,
    int posicao = 0,
  }) {
    return repository.moveTask(
      taskId: taskId,
      columnId: columnId,
      posicao: posicao,
    );
  }
}
