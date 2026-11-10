import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/project.dart';

part 'project_form_event.freezed.dart';

@freezed
abstract class ProjectFormEvent with _$ProjectFormEvent {
  const factory ProjectFormEvent.submitted({
    Project? initial,
    required String nome,
    required String cor,
    String? categoriaId,
  }) = ProjectFormSubmitted;
}
