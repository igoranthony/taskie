import '../entities/subtask.dart';
import '../repositories/subtask_repository.dart';

class CreateSubtask {
  final SubtaskRepository repository;

  CreateSubtask(this.repository);

  Future<Subtask> call({
    required String taskId,
    required String titulo,
    int? posicao,
  }) {
    return repository.create(taskId: taskId, titulo: titulo, posicao: posicao);
  }
}
