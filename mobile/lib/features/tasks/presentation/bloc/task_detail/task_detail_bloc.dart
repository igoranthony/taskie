import 'package:taskie/core/errors/app_error_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../../domain/usecases/create_subtask.dart';
import '../../../domain/usecases/toggle_subtask.dart';
import '../../../domain/usecases/delete_subtask.dart';
import '../../../domain/usecases/upload_attachment.dart';
import '../../../domain/usecases/delete_attachment.dart';
import 'task_detail_event.dart';
import 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  final TaskRepository _taskRepository;
  final CreateSubtask _createSubtask;
  final ToggleSubtask _toggleSubtask;
  final DeleteSubtask _deleteSubtask;
  final UploadAttachment _uploadAttachment;
  final DeleteAttachment _deleteAttachment;
  String? _taskId;

  TaskDetailBloc({
    required TaskRepository taskRepository,
    required CreateSubtask createSubtask,
    required ToggleSubtask toggleSubtask,
    required DeleteSubtask deleteSubtask,
    required UploadAttachment uploadAttachment,
    required DeleteAttachment deleteAttachment,
  })  : _taskRepository = taskRepository,
        _createSubtask = createSubtask,
        _toggleSubtask = toggleSubtask,
        _deleteSubtask = deleteSubtask,
        _uploadAttachment = uploadAttachment,
        _deleteAttachment = deleteAttachment,
        super(const TaskDetailState.initial()) {
    on<TaskDetailLoaded>(_onLoaded);
    on<TaskDetailRefreshed>(_onRefreshed);
    on<TaskDetailSubtaskAdded>(_onSubtaskAdded);
    on<TaskDetailSubtaskToggled>(_onSubtaskToggled);
    on<TaskDetailSubtaskDeleted>(_onSubtaskDeleted);
    on<TaskDetailAttachmentUploaded>(_onAttachmentUploaded);
    on<TaskDetailAttachmentDeleted>(_onAttachmentDeleted);
  }

  Future<void> _onLoaded(
    TaskDetailLoaded event,
    Emitter<TaskDetailState> emit,
  ) async {
    _taskId = event.taskId;
    emit(const TaskDetailState.loading());
    try {
      final task = await _taskRepository.getTaskById(event.taskId);
      emit(TaskDetailState.success(task));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onRefreshed(
    TaskDetailRefreshed event,
    Emitter<TaskDetailState> emit,
  ) async {
    if (_taskId == null) return;
    emit(const TaskDetailState.loading());
    try {
      final task = await _taskRepository.getTaskById(_taskId!);
      emit(TaskDetailState.success(task));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onSubtaskAdded(
    TaskDetailSubtaskAdded event,
    Emitter<TaskDetailState> emit,
  ) async {
    final current = state is TaskDetailSuccess ? state as TaskDetailSuccess : null;
    if (current == null) return;
    try {
      final created = await _createSubtask(
        taskId: current.task.id,
        titulo: event.titulo,
        posicao: current.task.subtarefas.length,
      );
      emit(TaskDetailState.success(
        current.task.copyWith(
          subtarefas: [...current.task.subtarefas, created],
        ),
      ));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> _onSubtaskToggled(
    TaskDetailSubtaskToggled event,
    Emitter<TaskDetailState> emit,
  ) async {
    final current = state is TaskDetailSuccess ? state as TaskDetailSuccess : null;
    if (current == null) return;
    try {
      final updated = await _toggleSubtask(event.subtaskId);
      emit(TaskDetailState.success(
        current.task.copyWith(
          subtarefas: current.task.subtarefas
              .map((s) => s.id == updated.id ? updated : s)
              .toList(),
        ),
      ));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> _onSubtaskDeleted(
    TaskDetailSubtaskDeleted event,
    Emitter<TaskDetailState> emit,
  ) async {
    final current = state is TaskDetailSuccess ? state as TaskDetailSuccess : null;
    if (current == null) return;
    try {
      await _deleteSubtask(event.subtaskId);
      emit(TaskDetailState.success(
        current.task.copyWith(
          subtarefas: current.task.subtarefas
              .where((s) => s.id != event.subtaskId)
              .toList(),
        ),
      ));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> _onAttachmentUploaded(
    TaskDetailAttachmentUploaded event,
    Emitter<TaskDetailState> emit,
  ) async {
    final current = state is TaskDetailSuccess ? state as TaskDetailSuccess : null;
    if (current == null) return;
    try {
      final created = await _uploadAttachment(
        taskId: current.task.id,
        arquivo: event.arquivo,
      );
      emit(TaskDetailState.success(
        current.task.copyWith(anexos: [...current.task.anexos, created]),
      ));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> _onAttachmentDeleted(
    TaskDetailAttachmentDeleted event,
    Emitter<TaskDetailState> emit,
  ) async {
    final current = state is TaskDetailSuccess ? state as TaskDetailSuccess : null;
    if (current == null) return;
    try {
      await _deleteAttachment(event.attachmentId);
      emit(TaskDetailState.success(
        current.task.copyWith(
          anexos: current.task.anexos
              .where((a) => a.id != event.attachmentId)
              .toList(),
        ),
      ));
    } catch (e) {
      emit(TaskDetailState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }
}
