import '../../domain/entities/task.dart';
import '../../domain/entities/task_history.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_remote_datasource.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<({List<Task> tasks, bool hasNext})> getTasks({
    int page = 1,
    TaskStatus? filterStatus,
    TaskPriority? filterPrioridade,
    String? filterSearch,
    int? filterCriadoPor,
    int? filterAtribuidoPara,
    DateTime? filterCriadoEmInicio,
    DateTime? filterCriadoEmFim,
    DateTime? filterDataLimiteInicio,
    DateTime? filterDataLimiteFim,
    String? filterProjeto,
    bool filterSemProjeto = false,
  }) async {
    final result = await remoteDataSource.getTasks(
      page: page,
      filterStatus: filterStatus,
      filterPrioridade: filterPrioridade,
      filterSearch: filterSearch,
      filterCriadoPor: filterCriadoPor,
      filterAtribuidoPara: filterAtribuidoPara,
      filterCriadoEmInicio: filterCriadoEmInicio,
      filterCriadoEmFim: filterCriadoEmFim,
      filterDataLimiteInicio: filterDataLimiteInicio,
      filterDataLimiteFim: filterDataLimiteFim,
      filterProjeto: filterProjeto,
      filterSemProjeto: filterSemProjeto,
    );
    return (
      tasks: result.tasks.map((m) => m.toEntity()).toList(),
      hasNext: result.hasNext,
    );
  }

  @override
  Future<Task> getTaskById(String id) async {
    final model = await remoteDataSource.getTaskById(id);
    return model.toEntity();
  }

  @override
  Future<Task> createTask(Task task) async {
    await remoteDataSource.createTask(_taskToMap(task));
    return task;
  }

  @override
  Future<Task> updateTask(Task task) async {
    await remoteDataSource.updateTask(task.id, _taskToMap(task));
    return task;
  }

  @override
  Future<void> deleteTask(String id) async {
    await remoteDataSource.deleteTask(id);
  }

  @override
  Future<List<TaskHistory>> getTaskHistory(String taskId) async {
    final models = await remoteDataSource.getTaskHistory(taskId);
    return models.map((m) => m.toEntity()).toList();
  }

  Map<String, dynamic> _taskToMap(Task task) {
    return {
      'titulo': task.titulo,
      if (task.descricao != null) 'descricao': task.descricao,
      'status': TaskModel.statusToString(task.status),
      'prioridade': TaskModel.priorityToString(task.prioridade),
      if (task.atribuidoParaId != null) 'atribuido_para': task.atribuidoParaId,
      if (task.dataLimite != null)
        'data_limite': task.dataLimite!.toIso8601String(),
      if (task.projetoId != null) 'projeto': task.projetoId,
    };
  }
}
