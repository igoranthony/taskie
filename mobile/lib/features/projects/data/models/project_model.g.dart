// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ProjectModel',
      json,
      ($checkedConvert) {
        final val = _ProjectModel(
          id: $checkedConvert('id', (v) => v as String),
          nome: $checkedConvert('nome', (v) => v as String),
          cor: $checkedConvert('cor', (v) => v as String),
          logoUrl: $checkedConvert('logo_url', (v) => v as String?),
          categoriaId: $checkedConvert('categoria', (v) => v as String?),
          categoriaNome: $checkedConvert('categoria_nome', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String),
          totalTasks: $checkedConvert(
            'total_tasks',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          doneTasks: $checkedConvert(
            'done_tasks',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          isOwner: $checkedConvert('is_owner', (v) => v as bool? ?? false),
          inviteCode: $checkedConvert('invite_code', (v) => v as String?),
          pendingMembersCount: $checkedConvert(
            'pending_members_count',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          criadoEm: $checkedConvert('criado_em', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'logoUrl': 'logo_url',
        'categoriaId': 'categoria',
        'categoriaNome': 'categoria_nome',
        'totalTasks': 'total_tasks',
        'doneTasks': 'done_tasks',
        'isOwner': 'is_owner',
        'inviteCode': 'invite_code',
        'pendingMembersCount': 'pending_members_count',
        'criadoEm': 'criado_em',
      },
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cor': instance.cor,
      'logo_url': instance.logoUrl,
      'categoria': instance.categoriaId,
      'categoria_nome': instance.categoriaNome,
      'status': instance.status,
      'total_tasks': instance.totalTasks,
      'done_tasks': instance.doneTasks,
      'is_owner': instance.isOwner,
      'invite_code': instance.inviteCode,
      'pending_members_count': instance.pendingMembersCount,
      'criado_em': instance.criadoEm,
    };
