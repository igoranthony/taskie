import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/project_member.dart';

part 'project_share_state.freezed.dart';

@freezed
class ProjectShareState with _$ProjectShareState {
  const factory ProjectShareState.initial() = ProjectShareInitial;
  const factory ProjectShareState.loading() = ProjectShareLoading;
  const factory ProjectShareState.loaded({
    required String inviteCode,
    required List<ProjectMember> members,
  }) = ProjectShareLoaded;
  const factory ProjectShareState.failure(String message) = ProjectShareFailure;
}
