import '../entities/project_member.dart';
import '../repositories/project_share_repository.dart';

class GetInviteCode {
  final ProjectShareRepository repository;
  GetInviteCode(this.repository);
  Future<String> call(String projectId) => repository.getInviteCode(projectId);
}

class RefreshInviteCode {
  final ProjectShareRepository repository;
  RefreshInviteCode(this.repository);
  Future<String> call(String projectId) =>
      repository.refreshInviteCode(projectId);
}

class JoinProject {
  final ProjectShareRepository repository;
  JoinProject(this.repository);
  Future<({String detail, String projectName})> call(String code) =>
      repository.joinByCode(code);
}

class GetMembers {
  final ProjectShareRepository repository;
  GetMembers(this.repository);
  Future<List<ProjectMember>> call(String projectId) =>
      repository.getMembers(projectId);
}

class AcceptMember {
  final ProjectShareRepository repository;
  AcceptMember(this.repository);
  Future<ProjectMember> call(String projectId, int userId) =>
      repository.acceptMember(projectId, userId);
}

class RejectMember {
  final ProjectShareRepository repository;
  RejectMember(this.repository);
  Future<void> call(String projectId, int userId) =>
      repository.rejectMember(projectId, userId);
}

class RemoveMember {
  final ProjectShareRepository repository;
  RemoveMember(this.repository);
  Future<void> call(String projectId, int userId) =>
      repository.removeMember(projectId, userId);
}
