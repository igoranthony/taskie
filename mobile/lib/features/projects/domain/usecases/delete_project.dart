import '../repositories/project_repository.dart';

class DeleteProject {
  final ProjectRepository repository;

  DeleteProject(this.repository);

  Future<void> call(String id) => repository.deleteProject(id);
}
