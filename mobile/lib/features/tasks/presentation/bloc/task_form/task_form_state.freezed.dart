// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFormState()';
}


}

/// @nodoc
class $TaskFormStateCopyWith<$Res>  {
$TaskFormStateCopyWith(TaskFormState _, $Res Function(TaskFormState) __);
}


/// Adds pattern-matching-related methods to [TaskFormState].
extension TaskFormStatePatterns on TaskFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskFormInitial value)?  initial,TResult Function( TaskFormLoading value)?  loading,TResult Function( TaskFormSuccess value)?  success,TResult Function( TaskFormFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskFormInitial() when initial != null:
return initial(_that);case TaskFormLoading() when loading != null:
return loading(_that);case TaskFormSuccess() when success != null:
return success(_that);case TaskFormFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskFormInitial value)  initial,required TResult Function( TaskFormLoading value)  loading,required TResult Function( TaskFormSuccess value)  success,required TResult Function( TaskFormFailure value)  failure,}){
final _that = this;
switch (_that) {
case TaskFormInitial():
return initial(_that);case TaskFormLoading():
return loading(_that);case TaskFormSuccess():
return success(_that);case TaskFormFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskFormInitial value)?  initial,TResult? Function( TaskFormLoading value)?  loading,TResult? Function( TaskFormSuccess value)?  success,TResult? Function( TaskFormFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TaskFormInitial() when initial != null:
return initial(_that);case TaskFormLoading() when loading != null:
return loading(_that);case TaskFormSuccess() when success != null:
return success(_that);case TaskFormFailure() when failure != null:
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
case TaskFormInitial() when initial != null:
return initial();case TaskFormLoading() when loading != null:
return loading();case TaskFormSuccess() when success != null:
return success(_that.task);case TaskFormFailure() when failure != null:
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
case TaskFormInitial():
return initial();case TaskFormLoading():
return loading();case TaskFormSuccess():
return success(_that.task);case TaskFormFailure():
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
case TaskFormInitial() when initial != null:
return initial();case TaskFormLoading() when loading != null:
return loading();case TaskFormSuccess() when success != null:
return success(_that.task);case TaskFormFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TaskFormInitial implements TaskFormState {
  const TaskFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFormState.initial()';
}


}




/// @nodoc


class TaskFormLoading implements TaskFormState {
  const TaskFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFormState.loading()';
}


}




/// @nodoc


class TaskFormSuccess implements TaskFormState {
  const TaskFormSuccess(this.task);
  

 final  Task task;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormSuccessCopyWith<TaskFormSuccess> get copyWith => _$TaskFormSuccessCopyWithImpl<TaskFormSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormSuccess&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskFormState.success(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskFormSuccessCopyWith<$Res> implements $TaskFormStateCopyWith<$Res> {
  factory $TaskFormSuccessCopyWith(TaskFormSuccess value, $Res Function(TaskFormSuccess) _then) = _$TaskFormSuccessCopyWithImpl;
@useResult
$Res call({
 Task task
});




}
/// @nodoc
class _$TaskFormSuccessCopyWithImpl<$Res>
    implements $TaskFormSuccessCopyWith<$Res> {
  _$TaskFormSuccessCopyWithImpl(this._self, this._then);

  final TaskFormSuccess _self;
  final $Res Function(TaskFormSuccess) _then;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskFormSuccess(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}


}

/// @nodoc


class TaskFormFailure implements TaskFormState {
  const TaskFormFailure(this.message);
  

 final  String message;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormFailureCopyWith<TaskFormFailure> get copyWith => _$TaskFormFailureCopyWithImpl<TaskFormFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskFormState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskFormFailureCopyWith<$Res> implements $TaskFormStateCopyWith<$Res> {
  factory $TaskFormFailureCopyWith(TaskFormFailure value, $Res Function(TaskFormFailure) _then) = _$TaskFormFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskFormFailureCopyWithImpl<$Res>
    implements $TaskFormFailureCopyWith<$Res> {
  _$TaskFormFailureCopyWithImpl(this._self, this._then);

  final TaskFormFailure _self;
  final $Res Function(TaskFormFailure) _then;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskFormFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
