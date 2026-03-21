import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/task_model.dart';
import '../models/task_history_model.dart';
import '../../domain/entities/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks({
    TaskStatus? filterStatus,
    TaskPriority? filterPrioridade,
    String? filterSearch,
    int? filterCriadoPor,
    int? filterAtribuidoPara,
    DateTime? filterCriadoEmInicio,
    DateTime? filterCriadoEmFim,
    DateTime? filterDataLimiteInicio,
    DateTime? filterDataLimiteFim,
  });
  Future<TaskModel> getTaskById(String id);
  Future<void> createTask(Map<String, dynamic> data);
  Future<void> updateTask(String id, Map<String, dynamic> data);
  Future<void> deleteTask(String id);
  Future<List<TaskHistoryModel>> getTaskHistory(String taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final Dio dio;

  TaskRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TaskModel>> getTasks({
    TaskStatus? filterStatus,
    TaskPriority? filterPrioridade,
    String? filterSearch,
    int? filterCriadoPor,
    int? filterAtribuidoPara,
    DateTime? filterCriadoEmInicio,
    DateTime? filterCriadoEmFim,
    DateTime? filterDataLimiteInicio,
    DateTime? filterDataLimiteFim,
  }) async {
    final queryParams = <String, dynamic>{};
    if (filterStatus != null) queryParams['status'] = _statusToString(filterStatus);
    if (filterPrioridade != null) queryParams['prioridade'] = _priorityToString(filterPrioridade);
    if (filterSearch != null && filterSearch.isNotEmpty) queryParams['search'] = filterSearch;
    if (filterCriadoPor != null) queryParams['criado_por'] = filterCriadoPor;
    if (filterAtribuidoPara != null) queryParams['atribuido_para'] = filterAtribuidoPara;
    if (filterCriadoEmInicio != null) queryParams['criado_em_inicio'] = filterCriadoEmInicio.toIso8601String();
    if (filterCriadoEmFim != null) queryParams['criado_em_fim'] = filterCriadoEmFim.toIso8601String();
    if (filterDataLimiteInicio != null) queryParams['data_limite_inicio'] = filterDataLimiteInicio.toIso8601String();
    if (filterDataLimiteFim != null) queryParams['data_limite_fim'] = filterDataLimiteFim.toIso8601String();

    final response = await dio.get(
      ApiEndpoints.tasks,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    final List<dynamic> data = response.data is List
        ? response.data
        : response.data['results'] ?? response.data;

    return data.map((json) => TaskModel.fromJson(json)).toList();
  }

  @override
  Future<TaskModel> getTaskById(String id) async {
    final response = await dio.get(ApiEndpoints.taskDetail(id));
    return TaskModel.fromJson(response.data);
  }

  @override
  Future<void> createTask(Map<String, dynamic> data) async {
    await dio.post(ApiEndpoints.tasks, data: data);
  }

  @override
  Future<void> updateTask(String id, Map<String, dynamic> data) async {
    await dio.patch(ApiEndpoints.taskDetail(id), data: data);
  }

  @override
  Future<void> deleteTask(String id) async {
    await dio.delete(ApiEndpoints.taskDetail(id));
  }

  @override
  Future<List<TaskHistoryModel>> getTaskHistory(String taskId) async {
    final response = await dio.get(ApiEndpoints.taskHistory(taskId));

    final List<dynamic> data = response.data is List
        ? response.data
        : response.data['results'] ?? response.data;

    return data.map((json) => TaskHistoryModel.fromJson(json)).toList();
  }

  String _statusToString(TaskStatus status) {
    switch (status) {
      case TaskStatus.backlog:
        return 'backlog';
      case TaskStatus.emAndamento:
        return 'em_andamento';
      case TaskStatus.concluido:
        return 'concluido';
    }
  }

  String _priorityToString(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.baixa:
        return 'baixa';
      case TaskPriority.media:
        return 'media';
      case TaskPriority.alta:
        return 'alta';
    }
  }
}
