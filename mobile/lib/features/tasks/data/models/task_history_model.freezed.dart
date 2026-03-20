// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskHistoryModel _$TaskHistoryModelFromJson(Map<String, dynamic> json) {
  return _TaskHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$TaskHistoryModel {
  @JsonKey(fromJson: _idFromJson)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_id', fromJson: _nullableToString)
  String? get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_name')
  String get fieldName => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_value')
  String? get oldValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_value')
  String? get newValue => throw _privateConstructorUsedError; // API returns FK int for changed_by; changed_by_username is the display value
  @JsonKey(name: 'changed_by_username')
  String get changedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'changed_at')
  String get changedAt => throw _privateConstructorUsedError;

  /// Serializes this TaskHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskHistoryModelCopyWith<TaskHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskHistoryModelCopyWith<$Res> {
  factory $TaskHistoryModelCopyWith(
    TaskHistoryModel value,
    $Res Function(TaskHistoryModel) then,
  ) = _$TaskHistoryModelCopyWithImpl<$Res, TaskHistoryModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _idFromJson) String id,
    @JsonKey(name: 'task_id', fromJson: _nullableToString) String? taskId,
    @JsonKey(name: 'field_name') String fieldName,
    @JsonKey(name: 'old_value') String? oldValue,
    @JsonKey(name: 'new_value') String? newValue,
    @JsonKey(name: 'changed_by_username') String changedBy,
    @JsonKey(name: 'changed_at') String changedAt,
  });
}

/// @nodoc
class _$TaskHistoryModelCopyWithImpl<$Res, $Val extends TaskHistoryModel>
    implements $TaskHistoryModelCopyWith<$Res> {
  _$TaskHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = freezed,
    Object? fieldName = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? changedBy = null,
    Object? changedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            taskId: freezed == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fieldName: null == fieldName
                ? _value.fieldName
                : fieldName // ignore: cast_nullable_to_non_nullable
                      as String,
            oldValue: freezed == oldValue
                ? _value.oldValue
                : oldValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            newValue: freezed == newValue
                ? _value.newValue
                : newValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            changedBy: null == changedBy
                ? _value.changedBy
                : changedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            changedAt: null == changedAt
                ? _value.changedAt
                : changedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskHistoryModelImplCopyWith<$Res>
    implements $TaskHistoryModelCopyWith<$Res> {
  factory _$$TaskHistoryModelImplCopyWith(
    _$TaskHistoryModelImpl value,
    $Res Function(_$TaskHistoryModelImpl) then,
  ) = __$$TaskHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _idFromJson) String id,
    @JsonKey(name: 'task_id', fromJson: _nullableToString) String? taskId,
    @JsonKey(name: 'field_name') String fieldName,
    @JsonKey(name: 'old_value') String? oldValue,
    @JsonKey(name: 'new_value') String? newValue,
    @JsonKey(name: 'changed_by_username') String changedBy,
    @JsonKey(name: 'changed_at') String changedAt,
  });
}

/// @nodoc
class __$$TaskHistoryModelImplCopyWithImpl<$Res>
    extends _$TaskHistoryModelCopyWithImpl<$Res, _$TaskHistoryModelImpl>
    implements _$$TaskHistoryModelImplCopyWith<$Res> {
  __$$TaskHistoryModelImplCopyWithImpl(
    _$TaskHistoryModelImpl _value,
    $Res Function(_$TaskHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = freezed,
    Object? fieldName = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? changedBy = null,
    Object? changedAt = null,
  }) {
    return _then(
      _$TaskHistoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        taskId: freezed == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fieldName: null == fieldName
            ? _value.fieldName
            : fieldName // ignore: cast_nullable_to_non_nullable
                  as String,
        oldValue: freezed == oldValue
            ? _value.oldValue
            : oldValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        newValue: freezed == newValue
            ? _value.newValue
            : newValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        changedBy: null == changedBy
            ? _value.changedBy
            : changedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        changedAt: null == changedAt
            ? _value.changedAt
            : changedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskHistoryModelImpl extends _TaskHistoryModel {
  const _$TaskHistoryModelImpl({
    @JsonKey(fromJson: _idFromJson) required this.id,
    @JsonKey(name: 'task_id', fromJson: _nullableToString) this.taskId,
    @JsonKey(name: 'field_name') required this.fieldName,
    @JsonKey(name: 'old_value') this.oldValue,
    @JsonKey(name: 'new_value') this.newValue,
    @JsonKey(name: 'changed_by_username') required this.changedBy,
    @JsonKey(name: 'changed_at') required this.changedAt,
  }) : super._();

  factory _$TaskHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskHistoryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _idFromJson)
  final String id;
  @override
  @JsonKey(name: 'task_id', fromJson: _nullableToString)
  final String? taskId;
  @override
  @JsonKey(name: 'field_name')
  final String fieldName;
  @override
  @JsonKey(name: 'old_value')
  final String? oldValue;
  @override
  @JsonKey(name: 'new_value')
  final String? newValue;
  // API returns FK int for changed_by; changed_by_username is the display value
  @override
  @JsonKey(name: 'changed_by_username')
  final String changedBy;
  @override
  @JsonKey(name: 'changed_at')
  final String changedAt;

  @override
  String toString() {
    return 'TaskHistoryModel(id: $id, taskId: $taskId, fieldName: $fieldName, oldValue: $oldValue, newValue: $newValue, changedBy: $changedBy, changedAt: $changedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskHistoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.changedBy, changedBy) ||
                other.changedBy == changedBy) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    taskId,
    fieldName,
    oldValue,
    newValue,
    changedBy,
    changedAt,
  );

  /// Create a copy of TaskHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskHistoryModelImplCopyWith<_$TaskHistoryModelImpl> get copyWith =>
      __$$TaskHistoryModelImplCopyWithImpl<_$TaskHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskHistoryModelImplToJson(this);
  }
}

abstract class _TaskHistoryModel extends TaskHistoryModel {
  const factory _TaskHistoryModel({
    @JsonKey(fromJson: _idFromJson) required final String id,
    @JsonKey(name: 'task_id', fromJson: _nullableToString) final String? taskId,
    @JsonKey(name: 'field_name') required final String fieldName,
    @JsonKey(name: 'old_value') final String? oldValue,
    @JsonKey(name: 'new_value') final String? newValue,
    @JsonKey(name: 'changed_by_username') required final String changedBy,
    @JsonKey(name: 'changed_at') required final String changedAt,
  }) = _$TaskHistoryModelImpl;
  const _TaskHistoryModel._() : super._();

  factory _TaskHistoryModel.fromJson(Map<String, dynamic> json) =
      _$TaskHistoryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _idFromJson)
  String get id;
  @override
  @JsonKey(name: 'task_id', fromJson: _nullableToString)
  String? get taskId;
  @override
  @JsonKey(name: 'field_name')
  String get fieldName;
  @override
  @JsonKey(name: 'old_value')
  String? get oldValue;
  @override
  @JsonKey(name: 'new_value')
  String? get newValue; // API returns FK int for changed_by; changed_by_username is the display value
  @override
  @JsonKey(name: 'changed_by_username')
  String get changedBy;
  @override
  @JsonKey(name: 'changed_at')
  String get changedAt;

  /// Create a copy of TaskHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskHistoryModelImplCopyWith<_$TaskHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
