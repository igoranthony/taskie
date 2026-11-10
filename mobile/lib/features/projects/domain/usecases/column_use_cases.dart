import '../entities/project_column.dart';
import '../repositories/column_repository.dart';

class CreateColumn {
  final ColumnRepository repository;
  CreateColumn(this.repository);
  Future<ProjectColumn> call({
    required String projectId,
    required String nome,
    required int posicao,
    bool isDoneColumn = false,
  }) =>
      repository.create(
        projectId: projectId,
        nome: nome,
        posicao: posicao,
        isDoneColumn: isDoneColumn,
      );
}

class UpdateColumn {
  final ColumnRepository repository;
  UpdateColumn(this.repository);
  Future<ProjectColumn> call({
    required String id,
    required String nome,
    required bool isDoneColumn,
  }) =>
      repository.update(id: id, nome: nome, isDoneColumn: isDoneColumn);
}

class DeleteColumn {
  final ColumnRepository repository;
  DeleteColumn(this.repository);
  Future<void> call(String id) => repository.delete(id);
}

class ReorderColumns {
  final ColumnRepository repository;
  ReorderColumns(this.repository);

  Future<void> call({
    required String projectId,
    required List<String> ids,
  }) =>
      repository.reorder(projectId: projectId, ids: ids);
}
