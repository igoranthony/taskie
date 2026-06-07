// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettingsModel _$UserSettingsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserSettingsModel', json, ($checkedConvert) {
      final val = _UserSettingsModel(
        tema: $checkedConvert('tema', (v) => v as String),
        corAccent: $checkedConvert('cor_accent', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'corAccent': 'cor_accent'});

Map<String, dynamic> _$UserSettingsModelToJson(_UserSettingsModel instance) =>
    <String, dynamic>{'tema': instance.tema, 'cor_accent': instance.corAccent};
