// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_UserModel',
  json,
  ($checkedConvert) {
    final val = _UserModel(
      id: $checkedConvert('id', (v) => _idFromJson(v)),
      email: $checkedConvert('email', (v) => v as String? ?? ''),
      firstName: $checkedConvert('first_name', (v) => v as String?),
      lastName: $checkedConvert('last_name', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
