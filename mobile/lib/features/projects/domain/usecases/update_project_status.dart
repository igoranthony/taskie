import '../entities/project.dart';
import '../repositories/project_repository.dart';

class UpdateProjectStatus {
  final ProjectRepository repository;

  UpdateProjectStatus(this.repository);

  Future<Project> call(String id, ProjectStatus status) =>
      repository.updateStatus(id, status);
}
