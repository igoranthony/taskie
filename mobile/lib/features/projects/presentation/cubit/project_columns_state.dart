import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/project_column.dart';

part 'project_columns_state.freezed.dart';

@freezed
class ProjectColumnsState with _$ProjectColumnsState {
  const factory ProjectColumnsState.initial() = ProjectColumnsInitial;
  const factory ProjectColumnsState.loading() = ProjectColumnsLoading;
  const factory ProjectColumnsState.loaded(List<ProjectColumn> columns) =
      ProjectColumnsLoaded;
  const factory ProjectColumnsState.failure(String message) =
      ProjectColumnsFailure;
}
