import '../entities/subtask.dart';

abstract class SubtaskRepository {
  Future<Subtask> create({
    required String taskId,
    required String titulo,
    int? posicao,
  });
  Future<Subtask> toggle(String id);
  Future<void> delete(String id);
}
