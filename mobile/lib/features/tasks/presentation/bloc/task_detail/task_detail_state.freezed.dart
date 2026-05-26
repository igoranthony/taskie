// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState()';
}


}

/// @nodoc
class $TaskDetailStateCopyWith<$Res>  {
$TaskDetailStateCopyWith(TaskDetailState _, $Res Function(TaskDetailState) __);
}


/// Adds pattern-matching-related methods to [TaskDetailState].
extension TaskDetailStatePatterns on TaskDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskDetailInitial value)?  initial,TResult Function( TaskDetailLoading value)?  loading,TResult Function( TaskDetailSuccess value)?  success,TResult Function( TaskDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial(_that);case TaskDetailLoading() when loading != null:
return loading(_that);case TaskDetailSuccess() when success != null:
return success(_that);case TaskDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskDetailInitial value)  initial,required TResult Function( TaskDetailLoading value)  loading,required TResult Function( TaskDetailSuccess value)  success,required TResult Function( TaskDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case TaskDetailInitial():
return initial(_that);case TaskDetailLoading():
return loading(_that);case TaskDetailSuccess():
return success(_that);case TaskDetailFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskDetailInitial value)?  initial,TResult? Function( TaskDetailLoading value)?  loading,TResult? Function( TaskDetailSuccess value)?  success,TResult? Function( TaskDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial(_that);case TaskDetailLoading() when loading != null:
return loading(_that);case TaskDetailSuccess() when success != null:
return success(_that);case TaskDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Task task)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial();case TaskDetailLoading() when loading != null:
return loading();case TaskDetailSuccess() when success != null:
return success(_that.task);case TaskDetailFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Task task)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case TaskDetailInitial():
return initial();case TaskDetailLoading():
return loading();case TaskDetailSuccess():
return success(_that.task);case TaskDetailFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Task task)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case TaskDetailInitial() when initial != null:
return initial();case TaskDetailLoading() when loading != null:
return loading();case TaskDetailSuccess() when success != null:
return success(_that.task);case TaskDetailFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TaskDetailInitial implements TaskDetailState {
  const TaskDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState.initial()';
}


}




/// @nodoc


class TaskDetailLoading implements TaskDetailState {
  const TaskDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailState.loading()';
}


}




/// @nodoc


class TaskDetailSuccess implements TaskDetailState {
  const TaskDetailSuccess(this.task);
  

 final  Task task;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailSuccessCopyWith<TaskDetailSuccess> get copyWith => _$TaskDetailSuccessCopyWithImpl<TaskDetailSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailSuccess&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskDetailState.success(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskDetailSuccessCopyWith<$Res> implements $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailSuccessCopyWith(TaskDetailSuccess value, $Res Function(TaskDetailSuccess) _then) = _$TaskDetailSuccessCopyWithImpl;
@useResult
$Res call({
 Task task
});




}
/// @nodoc
class _$TaskDetailSuccessCopyWithImpl<$Res>
    implements $TaskDetailSuccessCopyWith<$Res> {
  _$TaskDetailSuccessCopyWithImpl(this._self, this._then);

  final TaskDetailSuccess _self;
  final $Res Function(TaskDetailSuccess) _then;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskDetailSuccess(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}


}

/// @nodoc


class TaskDetailFailure implements TaskDetailState {
  const TaskDetailFailure(this.message);
  

 final  String message;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailFailureCopyWith<TaskDetailFailure> get copyWith => _$TaskDetailFailureCopyWithImpl<TaskDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskDetailState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskDetailFailureCopyWith<$Res> implements $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailFailureCopyWith(TaskDetailFailure value, $Res Function(TaskDetailFailure) _then) = _$TaskDetailFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskDetailFailureCopyWithImpl<$Res>
    implements $TaskDetailFailureCopyWith<$Res> {
  _$TaskDetailFailureCopyWithImpl(this._self, this._then);

  final TaskDetailFailure _self;
  final $Res Function(TaskDetailFailure) _then;

/// Create a copy of TaskDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskDetailFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
