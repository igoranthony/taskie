import '../entities/subtask.dart';
import '../repositories/subtask_repository.dart';

class ToggleSubtask {
  final SubtaskRepository repository;

  ToggleSubtask(this.repository);

  Future<Subtask> call(String id) => repository.toggle(id);
}
