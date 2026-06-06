import '../entities/project.dart';
import '../repositories/project_repository.dart';

class CreateProject {
  final ProjectRepository repository;

  CreateProject(this.repository);

  Future<Project> call({
    required String nome,
    required String cor,
    String? categoriaId,
  }) {
    return repository.createProject(
      nome: nome,
      cor: cor,
      categoriaId: categoriaId,
    );
  }
}
