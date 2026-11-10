import '../entities/project.dart';
import '../repositories/project_repository.dart';

class UpdateProject {
  final ProjectRepository repository;

  UpdateProject(this.repository);

  Future<Project> call({
    required String id,
    required String nome,
    required String cor,
    String? categoriaId,
  }) {
    return repository.updateProject(
      id: id,
      nome: nome,
      cor: cor,
      categoriaId: categoriaId,
    );
  }
}
