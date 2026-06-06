import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/project.dart';

part 'project_list_state.freezed.dart';

@freezed
class ProjectListState with _$ProjectListState {
  const factory ProjectListState.initial() = ProjectListInitial;
  const factory ProjectListState.loading() = ProjectListLoading;
  const factory ProjectListState.success({
    required List<Project> projects,
  }) = ProjectListSuccess;
  const factory ProjectListState.failure(String message) = ProjectListFailure;
}
