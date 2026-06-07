import '../../domain/entities/subtask.dart';
import '../../domain/repositories/subtask_repository.dart';
import '../datasources/subtask_remote_datasource.dart';

class SubtaskRepositoryImpl implements SubtaskRepository {
  final SubtaskRemoteDataSource remoteDataSource;

  SubtaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Subtask> create({
    required String taskId,
    required String titulo,
    int? posicao,
  }) async {
    final model = await remoteDataSource.create(
      taskId: taskId,
      titulo: titulo,
      posicao: posicao,
    );
    return model.toEntity();
  }

  @override
  Future<Subtask> toggle(String id) async {
    final model = await remoteDataSource.toggle(id);
    return model.toEntity();
  }

  @override
  Future<void> delete(String id) async {
    await remoteDataSource.delete(id);
  }
}
