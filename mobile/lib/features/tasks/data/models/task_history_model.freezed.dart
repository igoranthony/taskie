// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskHistoryModel {

@JsonKey(fromJson: _idFromJson) String get id;@JsonKey(name: 'task_id', fromJson: _nullableToString) String? get taskId;@JsonKey(name: 'field_name') String get fieldName;@JsonKey(name: 'old_value') String? get oldValue;@JsonKey(name: 'new_value') String? get newValue;// API returns FK int for changed_by; changed_by_username is the display value
@JsonKey(name: 'changed_by_username') String get changedBy;@JsonKey(name: 'changed_at') String get changedAt;
/// Create a copy of TaskHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskHistoryModelCopyWith<TaskHistoryModel> get copyWith => _$TaskHistoryModelCopyWithImpl<TaskHistoryModel>(this as TaskHistoryModel, _$identity);

  /// Serializes this TaskHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.fieldName, fieldName) || other.fieldName == fieldName)&&(identical(other.oldValue, oldValue) || other.oldValue == oldValue)&&(identical(other.newValue, newValue) || other.newValue == newValue)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&(identical(other.changedAt, changedAt) || other.changedAt == changedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,fieldName,oldValue,newValue,changedBy,changedAt);

@override
String toString() {
  return 'TaskHistoryModel(id: $id, taskId: $taskId, fieldName: $fieldName, oldValue: $oldValue, newValue: $newValue, changedBy: $changedBy, changedAt: $changedAt)';
}


}

/// @nodoc
abstract mixin class $TaskHistoryModelCopyWith<$Res>  {
  factory $TaskHistoryModelCopyWith(TaskHistoryModel value, $Res Function(TaskHistoryModel) _then) = _$TaskHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _idFromJson) String id,@JsonKey(name: 'task_id', fromJson: _nullableToString) String? taskId,@JsonKey(name: 'field_name') String fieldName,@JsonKey(name: 'old_value') String? oldValue,@JsonKey(name: 'new_value') String? newValue,@JsonKey(name: 'changed_by_username') String changedBy,@JsonKey(name: 'changed_at') String changedAt
});




}
/// @nodoc
class _$TaskHistoryModelCopyWithImpl<$Res>
    implements $TaskHistoryModelCopyWith<$Res> {
  _$TaskHistoryModelCopyWithImpl(this._self, this._then);

  final TaskHistoryModel _self;
  final $Res Function(TaskHistoryModel) _then;

/// Create a copy of TaskHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = freezed,Object? fieldName = null,Object? oldValue = freezed,Object? newValue = freezed,Object? changedBy = null,Object? changedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,fieldName: null == fieldName ? _self.fieldName : fieldName // ignore: cast_nullable_to_non_nullable
as String,oldValue: freezed == oldValue ? _self.oldValue : oldValue // ignore: cast_nullable_to_non_nullable
as String?,newValue: freezed == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as String?,changedBy: null == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String,changedAt: null == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskHistoryModel].
extension TaskHistoryModelPatterns on TaskHistoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskHistoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskHistoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskHistoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _idFromJson)  String id, @JsonKey(name: 'task_id', fromJson: _nullableToString)  String? taskId, @JsonKey(name: 'field_name')  String fieldName, @JsonKey(name: 'old_value')  String? oldValue, @JsonKey(name: 'new_value')  String? newValue, @JsonKey(name: 'changed_by_username')  String changedBy, @JsonKey(name: 'changed_at')  String changedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskHistoryModel() when $default != null:
return $default(_that.id,_that.taskId,_that.fieldName,_that.oldValue,_that.newValue,_that.changedBy,_that.changedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _idFromJson)  String id, @JsonKey(name: 'task_id', fromJson: _nullableToString)  String? taskId, @JsonKey(name: 'field_name')  String fieldName, @JsonKey(name: 'old_value')  String? oldValue, @JsonKey(name: 'new_value')  String? newValue, @JsonKey(name: 'changed_by_username')  String changedBy, @JsonKey(name: 'changed_at')  String changedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskHistoryModel():
return $default(_that.id,_that.taskId,_that.fieldName,_that.oldValue,_that.newValue,_that.changedBy,_that.changedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _idFromJson)  String id, @JsonKey(name: 'task_id', fromJson: _nullableToString)  String? taskId, @JsonKey(name: 'field_name')  String fieldName, @JsonKey(name: 'old_value')  String? oldValue, @JsonKey(name: 'new_value')  String? newValue, @JsonKey(name: 'changed_by_username')  String changedBy, @JsonKey(name: 'changed_at')  String changedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskHistoryModel() when $default != null:
return $default(_that.id,_that.taskId,_that.fieldName,_that.oldValue,_that.newValue,_that.changedBy,_that.changedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskHistoryModel extends TaskHistoryModel {
  const _TaskHistoryModel({@JsonKey(fromJson: _idFromJson) required this.id, @JsonKey(name: 'task_id', fromJson: _nullableToString) this.taskId, @JsonKey(name: 'field_name') required this.fieldName, @JsonKey(name: 'old_value') this.oldValue, @JsonKey(name: 'new_value') this.newValue, @JsonKey(name: 'changed_by_username') required this.changedBy, @JsonKey(name: 'changed_at') required this.changedAt}): super._();
  factory _TaskHistoryModel.fromJson(Map<String, dynamic> json) => _$TaskHistoryModelFromJson(json);

@override@JsonKey(fromJson: _idFromJson) final  String id;
@override@JsonKey(name: 'task_id', fromJson: _nullableToString) final  String? taskId;
@override@JsonKey(name: 'field_name') final  String fieldName;
@override@JsonKey(name: 'old_value') final  String? oldValue;
@override@JsonKey(name: 'new_value') final  String? newValue;
// API returns FK int for changed_by; changed_by_username is the display value
@override@JsonKey(name: 'changed_by_username') final  String changedBy;
@override@JsonKey(name: 'changed_at') final  String changedAt;

/// Create a copy of TaskHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskHistoryModelCopyWith<_TaskHistoryModel> get copyWith => __$TaskHistoryModelCopyWithImpl<_TaskHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.fieldName, fieldName) || other.fieldName == fieldName)&&(identical(other.oldValue, oldValue) || other.oldValue == oldValue)&&(identical(other.newValue, newValue) || other.newValue == newValue)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&(identical(other.changedAt, changedAt) || other.changedAt == changedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,fieldName,oldValue,newValue,changedBy,changedAt);

@override
String toString() {
  return 'TaskHistoryModel(id: $id, taskId: $taskId, fieldName: $fieldName, oldValue: $oldValue, newValue: $newValue, changedBy: $changedBy, changedAt: $changedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskHistoryModelCopyWith<$Res> implements $TaskHistoryModelCopyWith<$Res> {
  factory _$TaskHistoryModelCopyWith(_TaskHistoryModel value, $Res Function(_TaskHistoryModel) _then) = __$TaskHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _idFromJson) String id,@JsonKey(name: 'task_id', fromJson: _nullableToString) String? taskId,@JsonKey(name: 'field_name') String fieldName,@JsonKey(name: 'old_value') String? oldValue,@JsonKey(name: 'new_value') String? newValue,@JsonKey(name: 'changed_by_username') String changedBy,@JsonKey(name: 'changed_at') String changedAt
});




}
/// @nodoc
class __$TaskHistoryModelCopyWithImpl<$Res>
    implements _$TaskHistoryModelCopyWith<$Res> {
  __$TaskHistoryModelCopyWithImpl(this._self, this._then);

  final _TaskHistoryModel _self;
  final $Res Function(_TaskHistoryModel) _then;

/// Create a copy of TaskHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = freezed,Object? fieldName = null,Object? oldValue = freezed,Object? newValue = freezed,Object? changedBy = null,Object? changedAt = null,}) {
  return _then(_TaskHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,fieldName: null == fieldName ? _self.fieldName : fieldName // ignore: cast_nullable_to_non_nullable
as String,oldValue: freezed == oldValue ? _self.oldValue : oldValue // ignore: cast_nullable_to_non_nullable
as String?,newValue: freezed == newValue ? _self.newValue : newValue // ignore: cast_nullable_to_non_nullable
as String?,changedBy: null == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String,changedAt: null == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
