// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CategoryModel',
      json,
      ($checkedConvert) {
        final val = _CategoryModel(
          id: $checkedConvert('id', (v) => v as String),
          nome: $checkedConvert('nome', (v) => v as String),
          totalProjetos: $checkedConvert(
            'total_projetos',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          criadoEm: $checkedConvert('criado_em', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalProjetos': 'total_projetos',
        'criadoEm': 'criado_em',
      },
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'total_projetos': instance.totalProjetos,
      'criado_em': instance.criadoEm,
    };
