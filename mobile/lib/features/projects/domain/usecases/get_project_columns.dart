import '../entities/project_column.dart';
import '../repositories/project_repository.dart';

class GetProjectColumns {
  final ProjectRepository repository;

  GetProjectColumns(this.repository);

  Future<List<ProjectColumn>> call(String projectId) =>
      repository.getColumns(projectId);
}
