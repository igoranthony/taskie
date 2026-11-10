import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/core/errors/app_error_parser.dart';
import '../../../domain/usecases/create_project.dart';
import '../../../domain/usecases/update_project.dart';
import 'project_form_event.dart';
import 'project_form_state.dart';

class ProjectFormBloc extends Bloc<ProjectFormEvent, ProjectFormState> {
  final CreateProject _createProject;
  final UpdateProject _updateProject;

  ProjectFormBloc({
    required CreateProject createProject,
    required UpdateProject updateProject,
  })  : _createProject = createProject,
        _updateProject = updateProject,
        super(const ProjectFormState.initial()) {
    on<ProjectFormSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    ProjectFormSubmitted event,
    Emitter<ProjectFormState> emit,
  ) async {
    emit(const ProjectFormState.loading());
    try {
      final result = event.initial != null
          ? await _updateProject(
              id: event.initial!.id,
              nome: event.nome,
              cor: event.cor,
              categoriaId: event.categoriaId,
            )
          : await _createProject(
              nome: event.nome,
              cor: event.cor,
              categoriaId: event.categoriaId,
            );
      emit(ProjectFormState.success(result));
    } catch (e) {
      emit(ProjectFormState.failure(AppErrorParser.parse(e)));
    }
  }
}
