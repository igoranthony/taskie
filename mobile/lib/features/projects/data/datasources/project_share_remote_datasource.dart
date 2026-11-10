import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/project_member_model.dart';

abstract class ProjectShareRemoteDataSource {
  Future<String> getInviteCode(String projectId);
  Future<String> refreshInviteCode(String projectId);
  Future<({String detail, String projectName})> joinByCode(String code);
  Future<List<ProjectMemberModel>> getMembers(String projectId);
  Future<ProjectMemberModel> acceptMember(String projectId, int userId);
  Future<void> rejectMember(String projectId, int userId);
  Future<void> removeMember(String projectId, int userId);
}

class ProjectShareRemoteDataSourceImpl implements ProjectShareRemoteDataSource {
  final Dio dio;

  ProjectShareRemoteDataSourceImpl({required this.dio});

  @override
  Future<String> getInviteCode(String projectId) async {
    final response = await dio.get(ApiEndpoints.projectInviteCode(projectId));
    return response.data['invite_code'] as String;
  }

  @override
  Future<String> refreshInviteCode(String projectId) async {
    final response = await dio.post(
      ApiEndpoints.projectInviteCodeRefresh(projectId),
    );
    return response.data['invite_code'] as String;
  }

  @override
  Future<({String detail, String projectName})> joinByCode(String code) async {
    final response = await dio.post(
      ApiEndpoints.projectJoin,
      data: {'code': code},
    );
    return (
      detail: response.data['detail']?.toString() ?? '',
      projectName: response.data['project_name']?.toString() ?? '',
    );
  }

  @override
  Future<List<ProjectMemberModel>> getMembers(String projectId) async {
    final response = await dio.get(ApiEndpoints.projectMembers(projectId));
    final List<dynamic> data = response.data is List
        ? response.data
        : response.data['results'] ?? response.data;
    return data.map((json) => ProjectMemberModel.fromJson(json)).toList();
  }

  @override
  Future<ProjectMemberModel> acceptMember(String projectId, int userId) async {
    final response = await dio.post(
      ApiEndpoints.projectAcceptMember(projectId),
      data: {'user_id': userId},
    );
    return ProjectMemberModel.fromJson(response.data);
  }

  @override
  Future<void> rejectMember(String projectId, int userId) async {
    await dio.post(
      ApiEndpoints.projectRejectMember(projectId),
      data: {'user_id': userId},
    );
  }

  @override
  Future<void> removeMember(String projectId, int userId) async {
    await dio.post(
      ApiEndpoints.projectRemoveMember(projectId),
      data: {'user_id': userId},
    );
  }
}
