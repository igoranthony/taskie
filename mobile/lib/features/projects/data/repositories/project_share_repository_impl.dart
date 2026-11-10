import '../../domain/entities/project_member.dart';
import '../../domain/repositories/project_share_repository.dart';
import '../datasources/project_share_remote_datasource.dart';

class ProjectShareRepositoryImpl implements ProjectShareRepository {
  final ProjectShareRemoteDataSource remoteDataSource;

  ProjectShareRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> getInviteCode(String projectId) =>
      remoteDataSource.getInviteCode(projectId);

  @override
  Future<String> refreshInviteCode(String projectId) =>
      remoteDataSource.refreshInviteCode(projectId);

  @override
  Future<({String detail, String projectName})> joinByCode(String code) =>
      remoteDataSource.joinByCode(code);

  @override
  Future<List<ProjectMember>> getMembers(String projectId) async {
    final models = await remoteDataSource.getMembers(projectId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<ProjectMember> acceptMember(String projectId, int userId) async {
    final model = await remoteDataSource.acceptMember(projectId, userId);
    return model.toEntity();
  }

  @override
  Future<void> rejectMember(String projectId, int userId) =>
      remoteDataSource.rejectMember(projectId, userId);

  @override
  Future<void> removeMember(String projectId, int userId) =>
      remoteDataSource.removeMember(projectId, userId);
}
