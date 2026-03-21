import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<List<Task>> call({
    TaskStatus? status,
    TaskPriority? prioridade,
    String? search,
    int? criadoPor,
    int? atribuidoPara,
    DateTime? criadoEmInicio,
    DateTime? criadoEmFim,
    DateTime? dataLimiteInicio,
    DateTime? dataLimiteFim,
  }) {
    return repository.getTasks(
      filterStatus: status,
      filterPrioridade: prioridade,
      filterSearch: search,
      filterCriadoPor: criadoPor,
      filterAtribuidoPara: atribuidoPara,
      filterCriadoEmInicio: criadoEmInicio,
      filterCriadoEmFim: criadoEmFim,
      filterDataLimiteInicio: dataLimiteInicio,
      filterDataLimiteFim: dataLimiteFim,
    );
  }
}