import '../repositories/subtask_repository.dart';

class DeleteSubtask {
  final SubtaskRepository repository;

  DeleteSubtask(this.repository);

  Future<void> call(String id) => repository.delete(id);
}
