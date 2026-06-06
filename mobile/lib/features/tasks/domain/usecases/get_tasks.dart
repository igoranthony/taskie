import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<({List<Task> tasks, bool hasNext})> call({
    int page = 1,
    TaskStatus? status,
    TaskPriority? prioridade,
    String? search,
    int? criadoPor,
    int? atribuidoPara,
    DateTime? criadoEmInicio,
    DateTime? criadoEmFim,
    DateTime? dataLimiteInicio,
    DateTime? dataLimiteFim,
    String? projetoId,
    bool semProjeto = false,
  }) {
    return repository.getTasks(
      page: page,
      filterStatus: status,
      filterPrioridade: prioridade,
      filterSearch: search,
      filterCriadoPor: criadoPor,
      filterAtribuidoPara: atribuidoPara,
      filterCriadoEmInicio: criadoEmInicio,
      filterCriadoEmFim: criadoEmFim,
      filterDataLimiteInicio: dataLimiteInicio,
      filterDataLimiteFim: dataLimiteFim,
      filterProjeto: projetoId,
      filterSemProjeto: semProjeto,
    );
  }
}