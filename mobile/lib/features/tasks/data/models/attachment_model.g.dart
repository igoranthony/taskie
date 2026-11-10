// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttachmentModel _$AttachmentModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AttachmentModel',
      json,
      ($checkedConvert) {
        final val = _AttachmentModel(
          id: $checkedConvert('id', (v) => v as String),
          task: $checkedConvert('task', (v) => v as String),
          arquivoUrl: $checkedConvert('arquivo_url', (v) => v as String),
          nomeOriginal: $checkedConvert('nome_original', (v) => v as String),
          mimeType: $checkedConvert('mime_type', (v) => v as String?),
          tamanhoBytes: $checkedConvert(
            'tamanho_bytes',
            (v) => (v as num?)?.toInt(),
          ),
          criadoEm: $checkedConvert('criado_em', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'arquivoUrl': 'arquivo_url',
        'nomeOriginal': 'nome_original',
        'mimeType': 'mime_type',
        'tamanhoBytes': 'tamanho_bytes',
        'criadoEm': 'criado_em',
      },
    );

Map<String, dynamic> _$AttachmentModelToJson(_AttachmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'arquivo_url': instance.arquivoUrl,
      'nome_original': instance.nomeOriginal,
      'mime_type': instance.mimeType,
      'tamanho_bytes': instance.tamanhoBytes,
      'criado_em': instance.criadoEm,
    };
