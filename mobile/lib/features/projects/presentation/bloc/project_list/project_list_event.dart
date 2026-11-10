import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/project.dart';

part 'project_list_event.freezed.dart';

@freezed
class ProjectListEvent with _$ProjectListEvent {
  const factory ProjectListEvent.loaded() = ProjectListLoaded;
  const factory ProjectListEvent.refreshed() = ProjectListRefreshed;
  const factory ProjectListEvent.statusChanged(String id, ProjectStatus status) =
      ProjectListStatusChanged;
  const factory ProjectListEvent.deleted(String id) = ProjectListDeleted;
  const factory ProjectListEvent.projectUpserted(Project project) =
      ProjectListProjectUpserted;
}
