import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/project_remote_datasource.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl({required this.remoteDataSource});

  /// Colunas padrão criadas junto com um novo projeto. Como ainda não há
  /// tela de Kanban no mobile, criamos 3 colunas fixas — o backend exige
  /// o array `columns` no POST.
  static const _defaultColumns = [
    {'nome': 'A Fazer', 'posicao': 0, 'is_done_column': false},
    {'nome': 'Em Progresso', 'posicao': 1, 'is_done_column': false},
    {'nome': 'Concluído', 'posicao': 2, 'is_done_column': true},
  ];

  @override
  Future<List<Project>> getProjects() async {
    final models = await remoteDataSource.getProjects();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Project> getProject(String id) async {
    final model = await remoteDataSource.getProject(id);
    return model.toEntity();
  }

  @override
  Future<Project> createProject({
    required String nome,
    required String cor,
    String? categoriaId,
  }) async {
    final body = <String, dynamic>{
      'nome': nome,
      'cor': cor,
      'columns': _defaultColumns,
      'categoria': ?categoriaId,
    };
    final model = await remoteDataSource.createProject(body);
    return model.toEntity();
  }

  @override
  Future<Project> updateProject({
    required String id,
    required String nome,
    required String cor,
    String? categoriaId,
  }) async {
    final body = <String, dynamic>{
      'nome': nome,
      'cor': cor,
      'categoria': ?categoriaId,
    };
    final model = await remoteDataSource.updateProject(id, body);
    return model.toEntity();
  }

  @override
  Future<Project> updateStatus(String id, ProjectStatus status) async {
    final model = await remoteDataSource.updateStatus(
      id,
      ProjectModel.statusToString(status),
    );
    return model.toEntity();
  }

  @override
  Future<void> deleteProject(String id) async {
    await remoteDataSource.deleteProject(id);
  }
}
