import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<ProjectModel> getProject(String id);
  Future<ProjectModel> createProject(Map<String, dynamic> body);
  Future<ProjectModel> updateProject(String id, Map<String, dynamic> body);
  Future<ProjectModel> updateStatus(String id, String status);
  Future<void> deleteProject(String id);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final Dio dio;

  ProjectRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProjectModel>> getProjects() async {
    final response = await dio.get(ApiEndpoints.projects);
    final List<dynamic> data = response.data is List
        ? response.data
        : response.data['results'] ?? response.data;
    return data.map((json) => ProjectModel.fromJson(json)).toList();
  }

  @override
  Future<ProjectModel> getProject(String id) async {
    final response = await dio.get(ApiEndpoints.projectDetail(id));
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<ProjectModel> createProject(Map<String, dynamic> body) async {
    final response = await dio.post(ApiEndpoints.projects, data: body);
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<ProjectModel> updateProject(String id, Map<String, dynamic> body) async {
    final response = await dio.put(ApiEndpoints.projectDetail(id), data: body);
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<ProjectModel> updateStatus(String id, String status) async {
    final response = await dio.patch(
      ApiEndpoints.projectStatus(id),
      data: {'status': status},
    );
    return ProjectModel.fromJson(response.data);
  }

  @override
  Future<void> deleteProject(String id) async {
    await dio.delete(ApiEndpoints.projectDetail(id));
  }
}
