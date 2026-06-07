import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/subtask_model.dart';

abstract class SubtaskRemoteDataSource {
  Future<SubtaskModel> create({
    required String taskId,
    required String titulo,
    int? posicao,
  });
  Future<SubtaskModel> toggle(String id);
  Future<void> delete(String id);
}

class SubtaskRemoteDataSourceImpl implements SubtaskRemoteDataSource {
  final Dio dio;

  SubtaskRemoteDataSourceImpl({required this.dio});

  @override
  Future<SubtaskModel> create({
    required String taskId,
    required String titulo,
    int? posicao,
  }) async {
    final body = {
      'task': taskId,
      'titulo': titulo,
      'posicao': ?posicao,
    };
    final response = await dio.post(ApiEndpoints.subtasks, data: body);
    return SubtaskModel.fromJson(response.data);
  }

  @override
  Future<SubtaskModel> toggle(String id) async {
    final response = await dio.post(ApiEndpoints.subtaskToggle(id));
    return SubtaskModel.fromJson(response.data);
  }

  @override
  Future<void> delete(String id) async {
    await dio.delete(ApiEndpoints.subtaskDetail(id));
  }
}
