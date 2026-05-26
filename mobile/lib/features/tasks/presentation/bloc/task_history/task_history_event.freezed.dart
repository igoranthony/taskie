// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskHistoryEvent {

 String get taskId;
/// Create a copy of TaskHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskHistoryEventCopyWith<TaskHistoryEvent> get copyWith => _$TaskHistoryEventCopyWithImpl<TaskHistoryEvent>(this as TaskHistoryEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryEvent&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskHistoryEvent(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $TaskHistoryEventCopyWith<$Res>  {
  factory $TaskHistoryEventCopyWith(TaskHistoryEvent value, $Res Function(TaskHistoryEvent) _then) = _$TaskHistoryEventCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$TaskHistoryEventCopyWithImpl<$Res>
    implements $TaskHistoryEventCopyWith<$Res> {
  _$TaskHistoryEventCopyWithImpl(this._self, this._then);

  final TaskHistoryEvent _self;
  final $Res Function(TaskHistoryEvent) _then;

/// Create a copy of TaskHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,}) {
  return _then(_self.copyWith(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskHistoryEvent].
extension TaskHistoryEventPatterns on TaskHistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskHistoryLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskHistoryLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskHistoryLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case TaskHistoryLoaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskHistoryLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case TaskHistoryLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String taskId)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskHistoryLoaded() when loaded != null:
return loaded(_that.taskId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String taskId)  loaded,}) {final _that = this;
switch (_that) {
case TaskHistoryLoaded():
return loaded(_that.taskId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String taskId)?  loaded,}) {final _that = this;
switch (_that) {
case TaskHistoryLoaded() when loaded != null:
return loaded(_that.taskId);case _:
  return null;

}
}

}

/// @nodoc


class TaskHistoryLoaded implements TaskHistoryEvent {
  const TaskHistoryLoaded(this.taskId);
  

@override final  String taskId;

/// Create a copy of TaskHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskHistoryLoadedCopyWith<TaskHistoryLoaded> get copyWith => _$TaskHistoryLoadedCopyWithImpl<TaskHistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryLoaded&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskHistoryEvent.loaded(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $TaskHistoryLoadedCopyWith<$Res> implements $TaskHistoryEventCopyWith<$Res> {
  factory $TaskHistoryLoadedCopyWith(TaskHistoryLoaded value, $Res Function(TaskHistoryLoaded) _then) = _$TaskHistoryLoadedCopyWithImpl;
@override @useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$TaskHistoryLoadedCopyWithImpl<$Res>
    implements $TaskHistoryLoadedCopyWith<$Res> {
  _$TaskHistoryLoadedCopyWithImpl(this._self, this._then);

  final TaskHistoryLoaded _self;
  final $Res Function(TaskHistoryLoaded) _then;

/// Create a copy of TaskHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(TaskHistoryLoaded(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
