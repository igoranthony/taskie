import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/project.dart';

part 'project_form_state.freezed.dart';

@freezed
class ProjectFormState with _$ProjectFormState {
  const factory ProjectFormState.initial() = ProjectFormInitial;
  const factory ProjectFormState.loading() = ProjectFormLoading;
  const factory ProjectFormState.success(Project project) = ProjectFormSuccess;
  const factory ProjectFormState.failure(String message) = ProjectFormFailure;
}
