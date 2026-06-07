import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/project_member.dart';

part 'project_member_model.freezed.dart';
part 'project_member_model.g.dart';

@freezed
abstract class ProjectMemberModel with _$ProjectMemberModel {
  const ProjectMemberModel._();

  const factory ProjectMemberModel({
    required String id,
    required int usuario,
    required String username,
    @Default('') String email,
    required String status,
    @JsonKey(name: 'criado_em') required String criadoEm,
  }) = _ProjectMemberModel;

  factory ProjectMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectMemberModelFromJson(json);

  ProjectMember toEntity() => ProjectMember(
        id: id,
        usuarioId: usuario,
        username: username,
        email: email,
        status: _statusFromString(status),
        criadoEm: DateTime.parse(criadoEm).toLocal(),
      );

  static MemberStatus _statusFromString(String s) => switch (s) {
        'accepted' => MemberStatus.accepted,
        'rejected' => MemberStatus.rejected,
        _ => MemberStatus.pending,
      };
}
