import '../entities/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
  Future<Project> getProject(String id);
  Future<Project> createProject({
    required String nome,
    required String cor,
    String? categoriaId,
  });
  Future<Project> updateProject({
    required String id,
    required String nome,
    required String cor,
    String? categoriaId,
  });
  Future<Project> updateStatus(String id, ProjectStatus status);
  Future<void> deleteProject(String id);
}
