import '../entities/project.dart';
import '../repositories/project_repository.dart';

class GetProject {
  final ProjectRepository repository;

  GetProject(this.repository);

  Future<Project> call(String id) => repository.getProject(id);
}
