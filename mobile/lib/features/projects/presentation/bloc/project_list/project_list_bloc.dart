import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/core/errors/app_error_parser.dart';
import '../../../domain/usecases/get_projects.dart';
import '../../../domain/usecases/update_project_status.dart';
import '../../../domain/usecases/delete_project.dart';
import 'project_list_event.dart';
import 'project_list_state.dart';

class ProjectListBloc extends Bloc<ProjectListEvent, ProjectListState> {
  final GetProjects _getProjects;
  final UpdateProjectStatus _updateProjectStatus;
  final DeleteProject _deleteProject;

  ProjectListBloc({
    required GetProjects getProjects,
    required UpdateProjectStatus updateProjectStatus,
    required DeleteProject deleteProject,
  })  : _getProjects = getProjects,
        _updateProjectStatus = updateProjectStatus,
        _deleteProject = deleteProject,
        super(const ProjectListState.initial()) {
    on<ProjectListLoaded>(_onLoaded);
    on<ProjectListRefreshed>(_onRefreshed);
    on<ProjectListStatusChanged>(_onStatusChanged);
    on<ProjectListDeleted>(_onDeleted);
    on<ProjectListProjectUpserted>(_onProjectUpserted);
  }

  Future<void> _onLoaded(
    ProjectListLoaded event,
    Emitter<ProjectListState> emit,
  ) async {
    emit(const ProjectListState.loading());
    try {
      final projects = await _getProjects();
      emit(ProjectListState.success(projects: projects));
    } catch (e) {
      emit(ProjectListState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onRefreshed(
    ProjectListRefreshed event,
    Emitter<ProjectListState> emit,
  ) async {
    try {
      final projects = await _getProjects();
      emit(ProjectListState.success(projects: projects));
    } catch (e) {
      emit(ProjectListState.failure(AppErrorParser.parse(e)));
    }
  }

  Future<void> _onStatusChanged(
    ProjectListStatusChanged event,
    Emitter<ProjectListState> emit,
  ) async {
    final current = state is ProjectListSuccess ? state as ProjectListSuccess : null;
    if (current == null) return;
    try {
      final updated = await _updateProjectStatus(event.id, event.status);
      emit(ProjectListState.success(
        projects: current.projects
            .map((p) => p.id == updated.id ? updated : p)
            .toList(),
      ));
    } catch (e) {
      emit(ProjectListState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  Future<void> _onDeleted(
    ProjectListDeleted event,
    Emitter<ProjectListState> emit,
  ) async {
    final current = state is ProjectListSuccess ? state as ProjectListSuccess : null;
    if (current == null) return;
    try {
      await _deleteProject(event.id);
      emit(ProjectListState.success(
        projects: current.projects.where((p) => p.id != event.id).toList(),
      ));
    } catch (e) {
      emit(ProjectListState.failure(AppErrorParser.parse(e)));
      emit(current);
    }
  }

  void _onProjectUpserted(
    ProjectListProjectUpserted event,
    Emitter<ProjectListState> emit,
  ) {
    final current = state is ProjectListSuccess ? state as ProjectListSuccess : null;
    if (current == null) {
      emit(ProjectListState.success(projects: [event.project]));
      return;
    }
    final idx = current.projects.indexWhere((p) => p.id == event.project.id);
    final next = [...current.projects];
    if (idx >= 0) {
      next[idx] = event.project;
    } else {
      next.insert(0, event.project);
    }
    emit(ProjectListState.success(projects: next));
  }
}
