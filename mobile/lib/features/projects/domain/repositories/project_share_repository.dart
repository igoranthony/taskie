import '../entities/project_member.dart';

abstract class ProjectShareRepository {
  Future<String> getInviteCode(String projectId);
  Future<String> refreshInviteCode(String projectId);
  Future<({String detail, String projectName})> joinByCode(String code);
  Future<List<ProjectMember>> getMembers(String projectId);
  Future<ProjectMember> acceptMember(String projectId, int userId);
  Future<void> rejectMember(String projectId, int userId);
  Future<void> removeMember(String projectId, int userId);
}
