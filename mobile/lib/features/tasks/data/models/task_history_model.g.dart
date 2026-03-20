// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskHistoryModelImpl _$$TaskHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  r'_$TaskHistoryModelImpl',
  json,
  ($checkedConvert) {
    final val = _$TaskHistoryModelImpl(
      id: $checkedConvert('id', (v) => _idFromJson(v)),
      taskId: $checkedConvert('task_id', (v) => _nullableToString(v)),
      fieldName: $checkedConvert('field_name', (v) => v as String),
      oldValue: $checkedConvert('old_value', (v) => v as String?),
      newValue: $checkedConvert('new_value', (v) => v as String?),
      changedBy: $checkedConvert('changed_by_username', (v) => v as String),
      changedAt: $checkedConvert('changed_at', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'taskId': 'task_id',
    'fieldName': 'field_name',
    'oldValue': 'old_value',
    'newValue': 'new_value',
    'changedBy': 'changed_by_username',
    'changedAt': 'changed_at',
  },
);

Map<String, dynamic> _$$TaskHistoryModelImplToJson(
  _$TaskHistoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'task_id': instance.taskId,
  'field_name': instance.fieldName,
  'old_value': instance.oldValue,
  'new_value': instance.newValue,
  'changed_by_username': instance.changedBy,
  'changed_at': instance.changedAt,
};
