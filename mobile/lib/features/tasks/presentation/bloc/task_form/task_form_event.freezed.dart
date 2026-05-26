// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskFormEvent {

 Task? get initialTask; String get titulo; String? get descricao; TaskStatus get status; TaskPriority get prioridade; int? get atribuidoPara; DateTime? get dataLimite;
/// Create a copy of TaskFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormEventCopyWith<TaskFormEvent> get copyWith => _$TaskFormEventCopyWithImpl<TaskFormEvent>(this as TaskFormEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormEvent&&(identical(other.initialTask, initialTask) || other.initialTask == initialTask)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.status, status) || other.status == status)&&(identical(other.prioridade, prioridade) || other.prioridade == prioridade)&&(identical(other.atribuidoPara, atribuidoPara) || other.atribuidoPara == atribuidoPara)&&(identical(other.dataLimite, dataLimite) || other.dataLimite == dataLimite));
}


@override
int get hashCode => Object.hash(runtimeType,initialTask,titulo,descricao,status,prioridade,atribuidoPara,dataLimite);

@override
String toString() {
  return 'TaskFormEvent(initialTask: $initialTask, titulo: $titulo, descricao: $descricao, status: $status, prioridade: $prioridade, atribuidoPara: $atribuidoPara, dataLimite: $dataLimite)';
}


}

/// @nodoc
abstract mixin class $TaskFormEventCopyWith<$Res>  {
  factory $TaskFormEventCopyWith(TaskFormEvent value, $Res Function(TaskFormEvent) _then) = _$TaskFormEventCopyWithImpl;
@useResult
$Res call({
 Task? initialTask, String titulo, String? descricao, TaskStatus status, TaskPriority prioridade, int? atribuidoPara, DateTime? dataLimite
});




}
/// @nodoc
class _$TaskFormEventCopyWithImpl<$Res>
    implements $TaskFormEventCopyWith<$Res> {
  _$TaskFormEventCopyWithImpl(this._self, this._then);

  final TaskFormEvent _self;
  final $Res Function(TaskFormEvent) _then;

/// Create a copy of TaskFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialTask = freezed,Object? titulo = null,Object? descricao = freezed,Object? status = null,Object? prioridade = null,Object? atribuidoPara = freezed,Object? dataLimite = freezed,}) {
  return _then(_self.copyWith(
initialTask: freezed == initialTask ? _self.initialTask : initialTask // ignore: cast_nullable_to_non_nullable
as Task?,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,prioridade: null == prioridade ? _self.prioridade : prioridade // ignore: cast_nullable_to_non_nullable
as TaskPriority,atribuidoPara: freezed == atribuidoPara ? _self.atribuidoPara : atribuidoPara // ignore: cast_nullable_to_non_nullable
as int?,dataLimite: freezed == dataLimite ? _self.dataLimite : dataLimite // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskFormEvent].
extension TaskFormEventPatterns on TaskFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskFormSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case TaskFormSubmitted():
return submitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case TaskFormSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Task? initialTask,  String titulo,  String? descricao,  TaskStatus status,  TaskPriority prioridade,  int? atribuidoPara,  DateTime? dataLimite)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskFormSubmitted() when submitted != null:
return submitted(_that.initialTask,_that.titulo,_that.descricao,_that.status,_that.prioridade,_that.atribuidoPara,_that.dataLimite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Task? initialTask,  String titulo,  String? descricao,  TaskStatus status,  TaskPriority prioridade,  int? atribuidoPara,  DateTime? dataLimite)  submitted,}) {final _that = this;
switch (_that) {
case TaskFormSubmitted():
return submitted(_that.initialTask,_that.titulo,_that.descricao,_that.status,_that.prioridade,_that.atribuidoPara,_that.dataLimite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Task? initialTask,  String titulo,  String? descricao,  TaskStatus status,  TaskPriority prioridade,  int? atribuidoPara,  DateTime? dataLimite)?  submitted,}) {final _that = this;
switch (_that) {
case TaskFormSubmitted() when submitted != null:
return submitted(_that.initialTask,_that.titulo,_that.descricao,_that.status,_that.prioridade,_that.atribuidoPara,_that.dataLimite);case _:
  return null;

}
}

}

/// @nodoc


class TaskFormSubmitted implements TaskFormEvent {
  const TaskFormSubmitted({this.initialTask, required this.titulo, this.descricao, required this.status, required this.prioridade, this.atribuidoPara, this.dataLimite});
  

@override final  Task? initialTask;
@override final  String titulo;
@override final  String? descricao;
@override final  TaskStatus status;
@override final  TaskPriority prioridade;
@override final  int? atribuidoPara;
@override final  DateTime? dataLimite;

/// Create a copy of TaskFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormSubmittedCopyWith<TaskFormSubmitted> get copyWith => _$TaskFormSubmittedCopyWithImpl<TaskFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormSubmitted&&(identical(other.initialTask, initialTask) || other.initialTask == initialTask)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.status, status) || other.status == status)&&(identical(other.prioridade, prioridade) || other.prioridade == prioridade)&&(identical(other.atribuidoPara, atribuidoPara) || other.atribuidoPara == atribuidoPara)&&(identical(other.dataLimite, dataLimite) || other.dataLimite == dataLimite));
}


@override
int get hashCode => Object.hash(runtimeType,initialTask,titulo,descricao,status,prioridade,atribuidoPara,dataLimite);

@override
String toString() {
  return 'TaskFormEvent.submitted(initialTask: $initialTask, titulo: $titulo, descricao: $descricao, status: $status, prioridade: $prioridade, atribuidoPara: $atribuidoPara, dataLimite: $dataLimite)';
}


}

/// @nodoc
abstract mixin class $TaskFormSubmittedCopyWith<$Res> implements $TaskFormEventCopyWith<$Res> {
  factory $TaskFormSubmittedCopyWith(TaskFormSubmitted value, $Res Function(TaskFormSubmitted) _then) = _$TaskFormSubmittedCopyWithImpl;
@override @useResult
$Res call({
 Task? initialTask, String titulo, String? descricao, TaskStatus status, TaskPriority prioridade, int? atribuidoPara, DateTime? dataLimite
});




}
/// @nodoc
class _$TaskFormSubmittedCopyWithImpl<$Res>
    implements $TaskFormSubmittedCopyWith<$Res> {
  _$TaskFormSubmittedCopyWithImpl(this._self, this._then);

  final TaskFormSubmitted _self;
  final $Res Function(TaskFormSubmitted) _then;

/// Create a copy of TaskFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialTask = freezed,Object? titulo = null,Object? descricao = freezed,Object? status = null,Object? prioridade = null,Object? atribuidoPara = freezed,Object? dataLimite = freezed,}) {
  return _then(TaskFormSubmitted(
initialTask: freezed == initialTask ? _self.initialTask : initialTask // ignore: cast_nullable_to_non_nullable
as Task?,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,prioridade: null == prioridade ? _self.prioridade : prioridade // ignore: cast_nullable_to_non_nullable
as TaskPriority,atribuidoPara: freezed == atribuidoPara ? _self.atribuidoPara : atribuidoPara // ignore: cast_nullable_to_non_nullable
as int?,dataLimite: freezed == dataLimite ? _self.dataLimite : dataLimite // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
