// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailEvent()';
}


}

/// @nodoc
class $TaskDetailEventCopyWith<$Res>  {
$TaskDetailEventCopyWith(TaskDetailEvent _, $Res Function(TaskDetailEvent) __);
}


/// Adds pattern-matching-related methods to [TaskDetailEvent].
extension TaskDetailEventPatterns on TaskDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskDetailLoaded value)?  loaded,TResult Function( TaskDetailRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that);case TaskDetailRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskDetailLoaded value)  loaded,required TResult Function( TaskDetailRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case TaskDetailLoaded():
return loaded(_that);case TaskDetailRefreshed():
return refreshed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskDetailLoaded value)?  loaded,TResult? Function( TaskDetailRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that);case TaskDetailRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String taskId)?  loaded,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that.taskId);case TaskDetailRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String taskId)  loaded,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case TaskDetailLoaded():
return loaded(_that.taskId);case TaskDetailRefreshed():
return refreshed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String taskId)?  loaded,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that.taskId);case TaskDetailRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class TaskDetailLoaded implements TaskDetailEvent {
  const TaskDetailLoaded(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailLoadedCopyWith<TaskDetailLoaded> get copyWith => _$TaskDetailLoadedCopyWithImpl<TaskDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailLoaded&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskDetailEvent.loaded(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $TaskDetailLoadedCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailLoadedCopyWith(TaskDetailLoaded value, $Res Function(TaskDetailLoaded) _then) = _$TaskDetailLoadedCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$TaskDetailLoadedCopyWithImpl<$Res>
    implements $TaskDetailLoadedCopyWith<$Res> {
  _$TaskDetailLoadedCopyWithImpl(this._self, this._then);

  final TaskDetailLoaded _self;
  final $Res Function(TaskDetailLoaded) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(TaskDetailLoaded(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskDetailRefreshed implements TaskDetailEvent {
  const TaskDetailRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailEvent.refreshed()';
}


}




// dart format on
