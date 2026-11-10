import '../entities/project_column.dart';

abstract class ColumnRepository {
  Future<ProjectColumn> create({
    required String projectId,
    required String nome,
    required int posicao,
    required bool isDoneColumn,
  });
  Future<ProjectColumn> update({
    required String id,
    required String nome,
    required bool isDoneColumn,
  });
  Future<void> reorder({
    required String projectId,
    required List<String> ids,
  });
  Future<void> delete(String id);
}
