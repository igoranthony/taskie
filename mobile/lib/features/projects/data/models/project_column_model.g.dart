// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_column_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectColumnModel _$ProjectColumnModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ProjectColumnModel', json, ($checkedConvert) {
      final val = _ProjectColumnModel(
        id: $checkedConvert('id', (v) => v as String),
        nome: $checkedConvert('nome', (v) => v as String),
        posicao: $checkedConvert('posicao', (v) => (v as num?)?.toInt() ?? 0),
        isDoneColumn: $checkedConvert(
          'is_done_column',
          (v) => v as bool? ?? false,
        ),
      );
      return val;
    }, fieldKeyMap: const {'isDoneColumn': 'is_done_column'});

Map<String, dynamic> _$ProjectColumnModelToJson(_ProjectColumnModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'posicao': instance.posicao,
      'is_done_column': instance.isDoneColumn,
    };
