import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/project.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    required String id,
    required String nome,
    required String cor,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'categoria') String? categoriaId,
    @JsonKey(name: 'categoria_nome') String? categoriaNome,
    required String status,
    @JsonKey(name: 'total_tasks') @Default(0) int totalTasks,
    @JsonKey(name: 'done_tasks') @Default(0) int doneTasks,
    @JsonKey(name: 'is_owner') @Default(false) bool isOwner,
    @JsonKey(name: 'invite_code') String? inviteCode,
    @JsonKey(name: 'pending_members_count') @Default(0) int pendingMembersCount,
    @JsonKey(name: 'criado_em') required String criadoEm,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Project toEntity() => Project(
        id: id,
        nome: nome,
        cor: cor,
        logoUrl: logoUrl,
        categoriaId: categoriaId,
        categoriaNome: categoriaNome,
        status: statusFromString(status),
        totalTasks: totalTasks,
        doneTasks: doneTasks,
        isOwner: isOwner,
        inviteCode: inviteCode,
        pendingMembersCount: pendingMembersCount,
        criadoEm: DateTime.parse(criadoEm).toLocal(),
      );

  static ProjectStatus statusFromString(String s) => switch (s) {
        'pausado' => ProjectStatus.pausado,
        'concluido' => ProjectStatus.concluido,
        _ => ProjectStatus.ativo,
      };

  static String statusToString(ProjectStatus s) => switch (s) {
        ProjectStatus.ativo => 'ativo',
        ProjectStatus.pausado => 'pausado',
        ProjectStatus.concluido => 'concluido',
      };
}
