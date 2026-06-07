import '../../domain/entities/project_column.dart';
import '../../domain/repositories/column_repository.dart';
import '../datasources/column_remote_datasource.dart';

class ColumnRepositoryImpl implements ColumnRepository {
  final ColumnRemoteDataSource remoteDataSource;

  ColumnRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ProjectColumn> create({
    required String projectId,
    required String nome,
    required int posicao,
    required bool isDoneColumn,
  }) async {
    final model = await remoteDataSource.create(
      projectId: projectId,
      nome: nome,
      posicao: posicao,
      isDoneColumn: isDoneColumn,
    );
    return model.toEntity();
  }

  @override
  Future<ProjectColumn> update({
    required String id,
    required String nome,
    required bool isDoneColumn,
  }) async {
    final model = await remoteDataSource.update(
      id: id,
      nome: nome,
      isDoneColumn: isDoneColumn,
    );
    return model.toEntity();
  }

  @override
  Future<void> reorder({
    required String projectId,
    required List<String> ids,
  }) =>
      remoteDataSource.reorder(projectId: projectId, ids: ids);

  @override
  Future<void> delete(String id) => remoteDataSource.delete(id);
}
