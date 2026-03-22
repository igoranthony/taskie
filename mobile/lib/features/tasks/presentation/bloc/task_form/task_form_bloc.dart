import 'package:gestao_tarefas_tradex/core/errors/app_error_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/task.dart';
import '../../../domain/usecases/create_task.dart';
import '../../../domain/usecases/update_task.dart';
import 'task_form_event.dart';
import 'task_form_state.dart';

class TaskFormBloc extends Bloc<TaskFormEvent, TaskFormState> {
  final CreateTask _createTask;
  final UpdateTask _updateTask;

  TaskFormBloc({
    required CreateTask createTask,
    required UpdateTask updateTask,
  })  : _createTask = createTask,
        _updateTask = updateTask,
        super(const TaskFormState.initial()) {
    on<TaskFormSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    TaskFormSubmitted event,
    Emitter<TaskFormState> emit,
  ) async {
    emit(const TaskFormState.loading());
    try {
      final Task result;
      if (event.initialTask != null) {
        final updated = event.initialTask!.copyWith(
          titulo: event.titulo,
          descricao: event.descricao,
          status: event.status,
          prioridade: event.prioridade,
          atribuidoParaId: event.atribuidoPara,
          dataLimite: event.dataLimite,
        );
        result = await _updateTask(updated);
      } else {
        final newTask = Task(
          id: '',
          titulo: event.titulo,
          descricao: event.descricao,
          status: event.status,
          prioridade: event.prioridade,
          criadoPor: '',
          atribuidoParaId: event.atribuidoPara,
          dataLimite: event.dataLimite,
          criadoEm: DateTime.now(),
          atualizadoEm: DateTime.now(),
        );
        result = await _createTask(newTask);
      }
      emit(TaskFormState.success(result));
    } catch (e) {
      emit(TaskFormState.failure(AppErrorParser.parse(e)));
    }
  }
}
