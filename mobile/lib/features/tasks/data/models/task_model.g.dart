// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TaskModelImpl',
      json,
      ($checkedConvert) {
        final val = _$TaskModelImpl(
          id: $checkedConvert('id', (v) => v as String),
          titulo: $checkedConvert('titulo', (v) => v as String),
          descricao: $checkedConvert('descricao', (v) => v as String?),
          status: $checkedConvert('status', (v) => v as String),
          prioridade: $checkedConvert('prioridade', (v) => v as String),
          criadoPor: $checkedConvert('criado_por_username', (v) => v as String),
          atribuidoParaId: $checkedConvert(
            'atribuido_para',
            (v) => (v as num?)?.toInt(),
          ),
          atribuidoPara: $checkedConvert(
            'atribuido_para_username',
            (v) => v as String?,
          ),
          dataLimite: $checkedConvert('data_limite', (v) => v as String?),
          criadoEm: $checkedConvert('criado_em', (v) => v as String),
          atualizadoEm: $checkedConvert('atualizado_em', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'criadoPor': 'criado_por_username',
        'atribuidoParaId': 'atribuido_para',
        'atribuidoPara': 'atribuido_para_username',
        'dataLimite': 'data_limite',
        'criadoEm': 'criado_em',
        'atualizadoEm': 'atualizado_em',
      },
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'status': instance.status,
      'prioridade': instance.prioridade,
      'criado_por_username': instance.criadoPor,
      'atribuido_para': instance.atribuidoParaId,
      'atribuido_para_username': instance.atribuidoPara,
      'data_limite': instance.dataLimite,
      'criado_em': instance.criadoEm,
      'atualizado_em': instance.atualizadoEm,
    };
