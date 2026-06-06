// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListEvent()';
}


}

/// @nodoc
class $TaskListEventCopyWith<$Res>  {
$TaskListEventCopyWith(TaskListEvent _, $Res Function(TaskListEvent) __);
}


/// Adds pattern-matching-related methods to [TaskListEvent].
extension TaskListEventPatterns on TaskListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskListLoaded value)?  loaded,TResult Function( TaskListRefreshed value)?  refreshed,TResult Function( TaskListFiltered value)?  filtered,TResult Function( TaskListLoadedMore value)?  loadedMore,TResult Function( TaskListTaskDeleted value)?  taskDeleted,TResult Function( TaskListTaskUpdated value)?  taskUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskListLoaded() when loaded != null:
return loaded(_that);case TaskListRefreshed() when refreshed != null:
return refreshed(_that);case TaskListFiltered() when filtered != null:
return filtered(_that);case TaskListLoadedMore() when loadedMore != null:
return loadedMore(_that);case TaskListTaskDeleted() when taskDeleted != null:
return taskDeleted(_that);case TaskListTaskUpdated() when taskUpdated != null:
return taskUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskListLoaded value)  loaded,required TResult Function( TaskListRefreshed value)  refreshed,required TResult Function( TaskListFiltered value)  filtered,required TResult Function( TaskListLoadedMore value)  loadedMore,required TResult Function( TaskListTaskDeleted value)  taskDeleted,required TResult Function( TaskListTaskUpdated value)  taskUpdated,}){
final _that = this;
switch (_that) {
case TaskListLoaded():
return loaded(_that);case TaskListRefreshed():
return refreshed(_that);case TaskListFiltered():
return filtered(_that);case TaskListLoadedMore():
return loadedMore(_that);case TaskListTaskDeleted():
return taskDeleted(_that);case TaskListTaskUpdated():
return taskUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskListLoaded value)?  loaded,TResult? Function( TaskListRefreshed value)?  refreshed,TResult? Function( TaskListFiltered value)?  filtered,TResult? Function( TaskListLoadedMore value)?  loadedMore,TResult? Function( TaskListTaskDeleted value)?  taskDeleted,TResult? Function( TaskListTaskUpdated value)?  taskUpdated,}){
final _that = this;
switch (_that) {
case TaskListLoaded() when loaded != null:
return loaded(_that);case TaskListRefreshed() when refreshed != null:
return refreshed(_that);case TaskListFiltered() when filtered != null:
return filtered(_that);case TaskListLoadedMore() when loadedMore != null:
return loadedMore(_that);case TaskListTaskDeleted() when taskDeleted != null:
return taskDeleted(_that);case TaskListTaskUpdated() when taskUpdated != null:
return taskUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loaded,TResult Function()?  refreshed,TResult Function( TaskStatus? status,  TaskPriority? prioridade,  String? search,  int? criadoPor,  int? atribuidoPara,  DateTime? criadoEmInicio,  DateTime? criadoEmFim,  DateTime? dataLimiteInicio,  DateTime? dataLimiteFim,  String? projetoId,  bool semProjeto)?  filtered,TResult Function()?  loadedMore,TResult Function( String id)?  taskDeleted,TResult Function( Task task)?  taskUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskListLoaded() when loaded != null:
return loaded();case TaskListRefreshed() when refreshed != null:
return refreshed();case TaskListFiltered() when filtered != null:
return filtered(_that.status,_that.prioridade,_that.search,_that.criadoPor,_that.atribuidoPara,_that.criadoEmInicio,_that.criadoEmFim,_that.dataLimiteInicio,_that.dataLimiteFim,_that.projetoId,_that.semProjeto);case TaskListLoadedMore() when loadedMore != null:
return loadedMore();case TaskListTaskDeleted() when taskDeleted != null:
return taskDeleted(_that.id);case TaskListTaskUpdated() when taskUpdated != null:
return taskUpdated(_that.task);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loaded,required TResult Function()  refreshed,required TResult Function( TaskStatus? status,  TaskPriority? prioridade,  String? search,  int? criadoPor,  int? atribuidoPara,  DateTime? criadoEmInicio,  DateTime? criadoEmFim,  DateTime? dataLimiteInicio,  DateTime? dataLimiteFim,  String? projetoId,  bool semProjeto)  filtered,required TResult Function()  loadedMore,required TResult Function( String id)  taskDeleted,required TResult Function( Task task)  taskUpdated,}) {final _that = this;
switch (_that) {
case TaskListLoaded():
return loaded();case TaskListRefreshed():
return refreshed();case TaskListFiltered():
return filtered(_that.status,_that.prioridade,_that.search,_that.criadoPor,_that.atribuidoPara,_that.criadoEmInicio,_that.criadoEmFim,_that.dataLimiteInicio,_that.dataLimiteFim,_that.projetoId,_that.semProjeto);case TaskListLoadedMore():
return loadedMore();case TaskListTaskDeleted():
return taskDeleted(_that.id);case TaskListTaskUpdated():
return taskUpdated(_that.task);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loaded,TResult? Function()?  refreshed,TResult? Function( TaskStatus? status,  TaskPriority? prioridade,  String? search,  int? criadoPor,  int? atribuidoPara,  DateTime? criadoEmInicio,  DateTime? criadoEmFim,  DateTime? dataLimiteInicio,  DateTime? dataLimiteFim,  String? projetoId,  bool semProjeto)?  filtered,TResult? Function()?  loadedMore,TResult? Function( String id)?  taskDeleted,TResult? Function( Task task)?  taskUpdated,}) {final _that = this;
switch (_that) {
case TaskListLoaded() when loaded != null:
return loaded();case TaskListRefreshed() when refreshed != null:
return refreshed();case TaskListFiltered() when filtered != null:
return filtered(_that.status,_that.prioridade,_that.search,_that.criadoPor,_that.atribuidoPara,_that.criadoEmInicio,_that.criadoEmFim,_that.dataLimiteInicio,_that.dataLimiteFim,_that.projetoId,_that.semProjeto);case TaskListLoadedMore() when loadedMore != null:
return loadedMore();case TaskListTaskDeleted() when taskDeleted != null:
return taskDeleted(_that.id);case TaskListTaskUpdated() when taskUpdated != null:
return taskUpdated(_that.task);case _:
  return null;

}
}

}

/// @nodoc


class TaskListLoaded implements TaskListEvent {
  const TaskListLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListEvent.loaded()';
}


}




/// @nodoc


class TaskListRefreshed implements TaskListEvent {
  const TaskListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListEvent.refreshed()';
}


}




/// @nodoc


class TaskListFiltered implements TaskListEvent {
  const TaskListFiltered({this.status, this.prioridade, this.search, this.criadoPor, this.atribuidoPara, this.criadoEmInicio, this.criadoEmFim, this.dataLimiteInicio, this.dataLimiteFim, this.projetoId, this.semProjeto = false});
  

 final  TaskStatus? status;
 final  TaskPriority? prioridade;
 final  String? search;
 final  int? criadoPor;
 final  int? atribuidoPara;
 final  DateTime? criadoEmInicio;
 final  DateTime? criadoEmFim;
 final  DateTime? dataLimiteInicio;
 final  DateTime? dataLimiteFim;
 final  String? projetoId;
@JsonKey() final  bool semProjeto;

/// Create a copy of TaskListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListFilteredCopyWith<TaskListFiltered> get copyWith => _$TaskListFilteredCopyWithImpl<TaskListFiltered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListFiltered&&(identical(other.status, status) || other.status == status)&&(identical(other.prioridade, prioridade) || other.prioridade == prioridade)&&(identical(other.search, search) || other.search == search)&&(identical(other.criadoPor, criadoPor) || other.criadoPor == criadoPor)&&(identical(other.atribuidoPara, atribuidoPara) || other.atribuidoPara == atribuidoPara)&&(identical(other.criadoEmInicio, criadoEmInicio) || other.criadoEmInicio == criadoEmInicio)&&(identical(other.criadoEmFim, criadoEmFim) || other.criadoEmFim == criadoEmFim)&&(identical(other.dataLimiteInicio, dataLimiteInicio) || other.dataLimiteInicio == dataLimiteInicio)&&(identical(other.dataLimiteFim, dataLimiteFim) || other.dataLimiteFim == dataLimiteFim)&&(identical(other.projetoId, projetoId) || other.projetoId == projetoId)&&(identical(other.semProjeto, semProjeto) || other.semProjeto == semProjeto));
}


@override
int get hashCode => Object.hash(runtimeType,status,prioridade,search,criadoPor,atribuidoPara,criadoEmInicio,criadoEmFim,dataLimiteInicio,dataLimiteFim,projetoId,semProjeto);

@override
String toString() {
  return 'TaskListEvent.filtered(status: $status, prioridade: $prioridade, search: $search, criadoPor: $criadoPor, atribuidoPara: $atribuidoPara, criadoEmInicio: $criadoEmInicio, criadoEmFim: $criadoEmFim, dataLimiteInicio: $dataLimiteInicio, dataLimiteFim: $dataLimiteFim, projetoId: $projetoId, semProjeto: $semProjeto)';
}


}

/// @nodoc
abstract mixin class $TaskListFilteredCopyWith<$Res> implements $TaskListEventCopyWith<$Res> {
  factory $TaskListFilteredCopyWith(TaskListFiltered value, $Res Function(TaskListFiltered) _then) = _$TaskListFilteredCopyWithImpl;
@useResult
$Res call({
 TaskStatus? status, TaskPriority? prioridade, String? search, int? criadoPor, int? atribuidoPara, DateTime? criadoEmInicio, DateTime? criadoEmFim, DateTime? dataLimiteInicio, DateTime? dataLimiteFim, String? projetoId, bool semProjeto
});




}
/// @nodoc
class _$TaskListFilteredCopyWithImpl<$Res>
    implements $TaskListFilteredCopyWith<$Res> {
  _$TaskListFilteredCopyWithImpl(this._self, this._then);

  final TaskListFiltered _self;
  final $Res Function(TaskListFiltered) _then;

/// Create a copy of TaskListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? prioridade = freezed,Object? search = freezed,Object? criadoPor = freezed,Object? atribuidoPara = freezed,Object? criadoEmInicio = freezed,Object? criadoEmFim = freezed,Object? dataLimiteInicio = freezed,Object? dataLimiteFim = freezed,Object? projetoId = freezed,Object? semProjeto = null,}) {
  return _then(TaskListFiltered(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus?,prioridade: freezed == prioridade ? _self.prioridade : prioridade // ignore: cast_nullable_to_non_nullable
as TaskPriority?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,criadoPor: freezed == criadoPor ? _self.criadoPor : criadoPor // ignore: cast_nullable_to_non_nullable
as int?,atribuidoPara: freezed == atribuidoPara ? _self.atribuidoPara : atribuidoPara // ignore: cast_nullable_to_non_nullable
as int?,criadoEmInicio: freezed == criadoEmInicio ? _self.criadoEmInicio : criadoEmInicio // ignore: cast_nullable_to_non_nullable
as DateTime?,criadoEmFim: freezed == criadoEmFim ? _self.criadoEmFim : criadoEmFim // ignore: cast_nullable_to_non_nullable
as DateTime?,dataLimiteInicio: freezed == dataLimiteInicio ? _self.dataLimiteInicio : dataLimiteInicio // ignore: cast_nullable_to_non_nullable
as DateTime?,dataLimiteFim: freezed == dataLimiteFim ? _self.dataLimiteFim : dataLimiteFim // ignore: cast_nullable_to_non_nullable
as DateTime?,projetoId: freezed == projetoId ? _self.projetoId : projetoId // ignore: cast_nullable_to_non_nullable
as String?,semProjeto: null == semProjeto ? _self.semProjeto : semProjeto // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TaskListLoadedMore implements TaskListEvent {
  const TaskListLoadedMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListLoadedMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskListEvent.loadedMore()';
}


}




/// @nodoc


class TaskListTaskDeleted implements TaskListEvent {
  const TaskListTaskDeleted(this.id);
  

 final  String id;

/// Create a copy of TaskListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListTaskDeletedCopyWith<TaskListTaskDeleted> get copyWith => _$TaskListTaskDeletedCopyWithImpl<TaskListTaskDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListTaskDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TaskListEvent.taskDeleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $TaskListTaskDeletedCopyWith<$Res> implements $TaskListEventCopyWith<$Res> {
  factory $TaskListTaskDeletedCopyWith(TaskListTaskDeleted value, $Res Function(TaskListTaskDeleted) _then) = _$TaskListTaskDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TaskListTaskDeletedCopyWithImpl<$Res>
    implements $TaskListTaskDeletedCopyWith<$Res> {
  _$TaskListTaskDeletedCopyWithImpl(this._self, this._then);

  final TaskListTaskDeleted _self;
  final $Res Function(TaskListTaskDeleted) _then;

/// Create a copy of TaskListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(TaskListTaskDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskListTaskUpdated implements TaskListEvent {
  const TaskListTaskUpdated(this.task);
  

 final  Task task;

/// Create a copy of TaskListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListTaskUpdatedCopyWith<TaskListTaskUpdated> get copyWith => _$TaskListTaskUpdatedCopyWithImpl<TaskListTaskUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListTaskUpdated&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskListEvent.taskUpdated(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskListTaskUpdatedCopyWith<$Res> implements $TaskListEventCopyWith<$Res> {
  factory $TaskListTaskUpdatedCopyWith(TaskListTaskUpdated value, $Res Function(TaskListTaskUpdated) _then) = _$TaskListTaskUpdatedCopyWithImpl;
@useResult
$Res call({
 Task task
});




}
/// @nodoc
class _$TaskListTaskUpdatedCopyWithImpl<$Res>
    implements $TaskListTaskUpdatedCopyWith<$Res> {
  _$TaskListTaskUpdatedCopyWithImpl(this._self, this._then);

  final TaskListTaskUpdated _self;
  final $Res Function(TaskListTaskUpdated) _then;

/// Create a copy of TaskListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskListTaskUpdated(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}


}

// dart format on
