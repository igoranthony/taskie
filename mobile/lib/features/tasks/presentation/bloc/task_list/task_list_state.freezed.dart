// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListState()';
}


}

/// @nodoc
class $TaskListStateCopyWith<$Res>  {
$TaskListStateCopyWith(TaskListState _, $Res Function(TaskListState) __);
}


/// Adds pattern-matching-related methods to [TaskListState].
extension TaskListStatePatterns on TaskListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskListInitial value)?  initial,TResult Function( TaskListLoading value)?  loading,TResult Function( TaskListSuccess value)?  success,TResult Function( TaskListFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskListInitial() when initial != null:
return initial(_that);case TaskListLoading() when loading != null:
return loading(_that);case TaskListSuccess() when success != null:
return success(_that);case TaskListFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskListInitial value)  initial,required TResult Function( TaskListLoading value)  loading,required TResult Function( TaskListSuccess value)  success,required TResult Function( TaskListFailure value)  failure,}){
final _that = this;
switch (_that) {
case TaskListInitial():
return initial(_that);case TaskListLoading():
return loading(_that);case TaskListSuccess():
return success(_that);case TaskListFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskListInitial value)?  initial,TResult? Function( TaskListLoading value)?  loading,TResult? Function( TaskListSuccess value)?  success,TResult? Function( TaskListFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TaskListInitial() when initial != null:
return initial(_that);case TaskListLoading() when loading != null:
return loading(_that);case TaskListSuccess() when success != null:
return success(_that);case TaskListFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Task> tasks,  TaskStatus? filterStatus,  TaskPriority? filterPrioridade,  String? filterSearch,  int? filterCriadoPor,  int? filterAtribuidoPara,  DateTime? filterCriadoEmInicio,  DateTime? filterCriadoEmFim,  DateTime? filterDataLimiteInicio,  DateTime? filterDataLimiteFim,  int page,  bool hasReachedMax,  bool isLoadingMore)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskListInitial() when initial != null:
return initial();case TaskListLoading() when loading != null:
return loading();case TaskListSuccess() when success != null:
return success(_that.tasks,_that.filterStatus,_that.filterPrioridade,_that.filterSearch,_that.filterCriadoPor,_that.filterAtribuidoPara,_that.filterCriadoEmInicio,_that.filterCriadoEmFim,_that.filterDataLimiteInicio,_that.filterDataLimiteFim,_that.page,_that.hasReachedMax,_that.isLoadingMore);case TaskListFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Task> tasks,  TaskStatus? filterStatus,  TaskPriority? filterPrioridade,  String? filterSearch,  int? filterCriadoPor,  int? filterAtribuidoPara,  DateTime? filterCriadoEmInicio,  DateTime? filterCriadoEmFim,  DateTime? filterDataLimiteInicio,  DateTime? filterDataLimiteFim,  int page,  bool hasReachedMax,  bool isLoadingMore)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case TaskListInitial():
return initial();case TaskListLoading():
return loading();case TaskListSuccess():
return success(_that.tasks,_that.filterStatus,_that.filterPrioridade,_that.filterSearch,_that.filterCriadoPor,_that.filterAtribuidoPara,_that.filterCriadoEmInicio,_that.filterCriadoEmFim,_that.filterDataLimiteInicio,_that.filterDataLimiteFim,_that.page,_that.hasReachedMax,_that.isLoadingMore);case TaskListFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Task> tasks,  TaskStatus? filterStatus,  TaskPriority? filterPrioridade,  String? filterSearch,  int? filterCriadoPor,  int? filterAtribuidoPara,  DateTime? filterCriadoEmInicio,  DateTime? filterCriadoEmFim,  DateTime? filterDataLimiteInicio,  DateTime? filterDataLimiteFim,  int page,  bool hasReachedMax,  bool isLoadingMore)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case TaskListInitial() when initial != null:
return initial();case TaskListLoading() when loading != null:
return loading();case TaskListSuccess() when success != null:
return success(_that.tasks,_that.filterStatus,_that.filterPrioridade,_that.filterSearch,_that.filterCriadoPor,_that.filterAtribuidoPara,_that.filterCriadoEmInicio,_that.filterCriadoEmFim,_that.filterDataLimiteInicio,_that.filterDataLimiteFim,_that.page,_that.hasReachedMax,_that.isLoadingMore);case TaskListFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TaskListInitial implements TaskListState {
  const TaskListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListState.initial()';
}


}




/// @nodoc


class TaskListLoading implements TaskListState {
  const TaskListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListState.loading()';
}


}




/// @nodoc


class TaskListSuccess implements TaskListState {
  const TaskListSuccess({required final  List<Task> tasks, this.filterStatus, this.filterPrioridade, this.filterSearch, this.filterCriadoPor, this.filterAtribuidoPara, this.filterCriadoEmInicio, this.filterCriadoEmFim, this.filterDataLimiteInicio, this.filterDataLimiteFim, this.page = 1, this.hasReachedMax = false, this.isLoadingMore = false}): _tasks = tasks;
  

 final  List<Task> _tasks;
 List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  TaskStatus? filterStatus;
 final  TaskPriority? filterPrioridade;
 final  String? filterSearch;
 final  int? filterCriadoPor;
 final  int? filterAtribuidoPara;
 final  DateTime? filterCriadoEmInicio;
 final  DateTime? filterCriadoEmFim;
 final  DateTime? filterDataLimiteInicio;
 final  DateTime? filterDataLimiteFim;
@JsonKey() final  int page;
@JsonKey() final  bool hasReachedMax;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListSuccessCopyWith<TaskListSuccess> get copyWith => _$TaskListSuccessCopyWithImpl<TaskListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListSuccess&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.filterPrioridade, filterPrioridade) || other.filterPrioridade == filterPrioridade)&&(identical(other.filterSearch, filterSearch) || other.filterSearch == filterSearch)&&(identical(other.filterCriadoPor, filterCriadoPor) || other.filterCriadoPor == filterCriadoPor)&&(identical(other.filterAtribuidoPara, filterAtribuidoPara) || other.filterAtribuidoPara == filterAtribuidoPara)&&(identical(other.filterCriadoEmInicio, filterCriadoEmInicio) || other.filterCriadoEmInicio == filterCriadoEmInicio)&&(identical(other.filterCriadoEmFim, filterCriadoEmFim) || other.filterCriadoEmFim == filterCriadoEmFim)&&(identical(other.filterDataLimiteInicio, filterDataLimiteInicio) || other.filterDataLimiteInicio == filterDataLimiteInicio)&&(identical(other.filterDataLimiteFim, filterDataLimiteFim) || other.filterDataLimiteFim == filterDataLimiteFim)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),filterStatus,filterPrioridade,filterSearch,filterCriadoPor,filterAtribuidoPara,filterCriadoEmInicio,filterCriadoEmFim,filterDataLimiteInicio,filterDataLimiteFim,page,hasReachedMax,isLoadingMore);

@override
String toString() {
  return 'TaskListState.success(tasks: $tasks, filterStatus: $filterStatus, filterPrioridade: $filterPrioridade, filterSearch: $filterSearch, filterCriadoPor: $filterCriadoPor, filterAtribuidoPara: $filterAtribuidoPara, filterCriadoEmInicio: $filterCriadoEmInicio, filterCriadoEmFim: $filterCriadoEmFim, filterDataLimiteInicio: $filterDataLimiteInicio, filterDataLimiteFim: $filterDataLimiteFim, page: $page, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $TaskListSuccessCopyWith<$Res> implements $TaskListStateCopyWith<$Res> {
  factory $TaskListSuccessCopyWith(TaskListSuccess value, $Res Function(TaskListSuccess) _then) = _$TaskListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Task> tasks, TaskStatus? filterStatus, TaskPriority? filterPrioridade, String? filterSearch, int? filterCriadoPor, int? filterAtribuidoPara, DateTime? filterCriadoEmInicio, DateTime? filterCriadoEmFim, DateTime? filterDataLimiteInicio, DateTime? filterDataLimiteFim, int page, bool hasReachedMax, bool isLoadingMore
});




}
/// @nodoc
class _$TaskListSuccessCopyWithImpl<$Res>
    implements $TaskListSuccessCopyWith<$Res> {
  _$TaskListSuccessCopyWithImpl(this._self, this._then);

  final TaskListSuccess _self;
  final $Res Function(TaskListSuccess) _then;

/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,Object? filterStatus = freezed,Object? filterPrioridade = freezed,Object? filterSearch = freezed,Object? filterCriadoPor = freezed,Object? filterAtribuidoPara = freezed,Object? filterCriadoEmInicio = freezed,Object? filterCriadoEmFim = freezed,Object? filterDataLimiteInicio = freezed,Object? filterDataLimiteFim = freezed,Object? page = null,Object? hasReachedMax = null,Object? isLoadingMore = null,}) {
  return _then(TaskListSuccess(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,filterStatus: freezed == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as TaskStatus?,filterPrioridade: freezed == filterPrioridade ? _self.filterPrioridade : filterPrioridade // ignore: cast_nullable_to_non_nullable
as TaskPriority?,filterSearch: freezed == filterSearch ? _self.filterSearch : filterSearch // ignore: cast_nullable_to_non_nullable
as String?,filterCriadoPor: freezed == filterCriadoPor ? _self.filterCriadoPor : filterCriadoPor // ignore: cast_nullable_to_non_nullable
as int?,filterAtribuidoPara: freezed == filterAtribuidoPara ? _self.filterAtribuidoPara : filterAtribuidoPara // ignore: cast_nullable_to_non_nullable
as int?,filterCriadoEmInicio: freezed == filterCriadoEmInicio ? _self.filterCriadoEmInicio : filterCriadoEmInicio // ignore: cast_nullable_to_non_nullable
as DateTime?,filterCriadoEmFim: freezed == filterCriadoEmFim ? _self.filterCriadoEmFim : filterCriadoEmFim // ignore: cast_nullable_to_non_nullable
as DateTime?,filterDataLimiteInicio: freezed == filterDataLimiteInicio ? _self.filterDataLimiteInicio : filterDataLimiteInicio // ignore: cast_nullable_to_non_nullable
as DateTime?,filterDataLimiteFim: freezed == filterDataLimiteFim ? _self.filterDataLimiteFim : filterDataLimiteFim // ignore: cast_nullable_to_non_nullable
as DateTime?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TaskListFailure implements TaskListState {
  const TaskListFailure(this.message);
  

 final  String message;

/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListFailureCopyWith<TaskListFailure> get copyWith => _$TaskListFailureCopyWithImpl<TaskListFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskListFailureCopyWith<$Res> implements $TaskListStateCopyWith<$Res> {
  factory $TaskListFailureCopyWith(TaskListFailure value, $Res Function(TaskListFailure) _then) = _$TaskListFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskListFailureCopyWithImpl<$Res>
    implements $TaskListFailureCopyWith<$Res> {
  _$TaskListFailureCopyWithImpl(this._self, this._then);

  final TaskListFailure _self;
  final $Res Function(TaskListFailure) _then;

/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskListFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
