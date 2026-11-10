// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectMemberModel _$ProjectMemberModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProjectMemberModel', json, ($checkedConvert) {
      final val = _ProjectMemberModel(
        id: $checkedConvert('id', (v) => v as String),
        usuario: $checkedConvert('usuario', (v) => (v as num).toInt()),
        username: $checkedConvert('username', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String? ?? ''),
        status: $checkedConvert('status', (v) => v as String),
        criadoEm: $checkedConvert('criado_em', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'criadoEm': 'criado_em'});

Map<String, dynamic> _$ProjectMemberModelToJson(_ProjectMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario': instance.usuario,
      'username': instance.username,
      'email': instance.email,
      'status': instance.status,
      'criado_em': instance.criadoEm,
    };
