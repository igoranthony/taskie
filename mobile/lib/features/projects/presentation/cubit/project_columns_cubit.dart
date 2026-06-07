import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskie/core/errors/app_error_parser.dart';
import '../../domain/entities/project_column.dart';
import '../../domain/usecases/get_project_columns.dart';
import 'project_columns_state.dart';

class ProjectColumnsCubit extends Cubit<ProjectColumnsState> {
  final GetProjectColumns _getColumns;

  ProjectColumnsCubit(this._getColumns)
      : super(const ProjectColumnsState.initial());

  Future<void> load(String projectId) async {
    emit(const ProjectColumnsState.loading());
    try {
      final columns = await _getColumns(projectId);
      emit(ProjectColumnsState.loaded(columns));
    } catch (e) {
      emit(ProjectColumnsState.failure(AppErrorParser.parse(e)));
    }
  }

  /// Lookup helper — devolve a coluna pelo id, ou `null` se ainda não carregou
  /// ou não existir.
  ProjectColumn? columnById(String? id) {
    if (id == null) return null;
    final s = state;
    if (s is! ProjectColumnsLoaded) return null;
    for (final c in s.columns) {
      if (c.id == id) return c;
    }
    return null;
  }
}
