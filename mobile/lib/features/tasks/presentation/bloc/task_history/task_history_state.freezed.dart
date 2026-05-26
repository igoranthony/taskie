// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskHistoryState()';
}


}

/// @nodoc
class $TaskHistoryStateCopyWith<$Res>  {
$TaskHistoryStateCopyWith(TaskHistoryState _, $Res Function(TaskHistoryState) __);
}


/// Adds pattern-matching-related methods to [TaskHistoryState].
extension TaskHistoryStatePatterns on TaskHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskHistoryInitial value)?  initial,TResult Function( TaskHistoryLoading value)?  loading,TResult Function( TaskHistorySuccess value)?  success,TResult Function( TaskHistoryFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskHistoryInitial() when initial != null:
return initial(_that);case TaskHistoryLoading() when loading != null:
return loading(_that);case TaskHistorySuccess() when success != null:
return success(_that);case TaskHistoryFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskHistoryInitial value)  initial,required TResult Function( TaskHistoryLoading value)  loading,required TResult Function( TaskHistorySuccess value)  success,required TResult Function( TaskHistoryFailure value)  failure,}){
final _that = this;
switch (_that) {
case TaskHistoryInitial():
return initial(_that);case TaskHistoryLoading():
return loading(_that);case TaskHistorySuccess():
return success(_that);case TaskHistoryFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskHistoryInitial value)?  initial,TResult? Function( TaskHistoryLoading value)?  loading,TResult? Function( TaskHistorySuccess value)?  success,TResult? Function( TaskHistoryFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TaskHistoryInitial() when initial != null:
return initial(_that);case TaskHistoryLoading() when loading != null:
return loading(_that);case TaskHistorySuccess() when success != null:
return success(_that);case TaskHistoryFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TaskHistory> history)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskHistoryInitial() when initial != null:
return initial();case TaskHistoryLoading() when loading != null:
return loading();case TaskHistorySuccess() when success != null:
return success(_that.history);case TaskHistoryFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TaskHistory> history)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case TaskHistoryInitial():
return initial();case TaskHistoryLoading():
return loading();case TaskHistorySuccess():
return success(_that.history);case TaskHistoryFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TaskHistory> history)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case TaskHistoryInitial() when initial != null:
return initial();case TaskHistoryLoading() when loading != null:
return loading();case TaskHistorySuccess() when success != null:
return success(_that.history);case TaskHistoryFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TaskHistoryInitial implements TaskHistoryState {
  const TaskHistoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskHistoryState.initial()';
}


}




/// @nodoc


class TaskHistoryLoading implements TaskHistoryState {
  const TaskHistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskHistoryState.loading()';
}


}




/// @nodoc


class TaskHistorySuccess implements TaskHistoryState {
  const TaskHistorySuccess(final  List<TaskHistory> history): _history = history;
  

 final  List<TaskHistory> _history;
 List<TaskHistory> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of TaskHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskHistorySuccessCopyWith<TaskHistorySuccess> get copyWith => _$TaskHistorySuccessCopyWithImpl<TaskHistorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistorySuccess&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'TaskHistoryState.success(history: $history)';
}


}

/// @nodoc
abstract mixin class $TaskHistorySuccessCopyWith<$Res> implements $TaskHistoryStateCopyWith<$Res> {
  factory $TaskHistorySuccessCopyWith(TaskHistorySuccess value, $Res Function(TaskHistorySuccess) _then) = _$TaskHistorySuccessCopyWithImpl;
@useResult
$Res call({
 List<TaskHistory> history
});




}
/// @nodoc
class _$TaskHistorySuccessCopyWithImpl<$Res>
    implements $TaskHistorySuccessCopyWith<$Res> {
  _$TaskHistorySuccessCopyWithImpl(this._self, this._then);

  final TaskHistorySuccess _self;
  final $Res Function(TaskHistorySuccess) _then;

/// Create a copy of TaskHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? history = null,}) {
  return _then(TaskHistorySuccess(
null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<TaskHistory>,
  ));
}


}

/// @nodoc


class TaskHistoryFailure implements TaskHistoryState {
  const TaskHistoryFailure(this.message);
  

 final  String message;

/// Create a copy of TaskHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskHistoryFailureCopyWith<TaskHistoryFailure> get copyWith => _$TaskHistoryFailureCopyWithImpl<TaskHistoryFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskHistoryFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskHistoryState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskHistoryFailureCopyWith<$Res> implements $TaskHistoryStateCopyWith<$Res> {
  factory $TaskHistoryFailureCopyWith(TaskHistoryFailure value, $Res Function(TaskHistoryFailure) _then) = _$TaskHistoryFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskHistoryFailureCopyWithImpl<$Res>
    implements $TaskHistoryFailureCopyWith<$Res> {
  _$TaskHistoryFailureCopyWithImpl(this._self, this._then);

  final TaskHistoryFailure _self;
  final $Res Function(TaskHistoryFailure) _then;

/// Create a copy of TaskHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskHistoryFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
