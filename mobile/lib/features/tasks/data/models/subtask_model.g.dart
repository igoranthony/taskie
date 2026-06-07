// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubtaskModel _$SubtaskModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SubtaskModel', json, ($checkedConvert) {
      final val = _SubtaskModel(
        id: $checkedConvert('id', (v) => v as String),
        task: $checkedConvert('task', (v) => v as String),
        titulo: $checkedConvert('titulo', (v) => v as String),
        concluida: $checkedConvert('concluida', (v) => v as bool? ?? false),
        posicao: $checkedConvert('posicao', (v) => (v as num?)?.toInt() ?? 0),
        criadoEm: $checkedConvert('criado_em', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'criadoEm': 'criado_em'});

Map<String, dynamic> _$SubtaskModelToJson(_SubtaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'titulo': instance.titulo,
      'concluida': instance.concluida,
      'posicao': instance.posicao,
      'criado_em': instance.criadoEm,
    };
