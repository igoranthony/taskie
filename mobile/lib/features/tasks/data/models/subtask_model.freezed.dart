// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubtaskModel {

 String get id; String get task; String get titulo; bool get concluida; int get posicao;@JsonKey(name: 'criado_em') String get criadoEm;
/// Create a copy of SubtaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtaskModelCopyWith<SubtaskModel> get copyWith => _$SubtaskModelCopyWithImpl<SubtaskModel>(this as SubtaskModel, _$identity);

  /// Serializes this SubtaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubtaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.concluida, concluida) || other.concluida == concluida)&&(identical(other.posicao, posicao) || other.posicao == posicao)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,titulo,concluida,posicao,criadoEm);

@override
String toString() {
  return 'SubtaskModel(id: $id, task: $task, titulo: $titulo, concluida: $concluida, posicao: $posicao, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class $SubtaskModelCopyWith<$Res>  {
  factory $SubtaskModelCopyWith(SubtaskModel value, $Res Function(SubtaskModel) _then) = _$SubtaskModelCopyWithImpl;
@useResult
$Res call({
 String id, String task, String titulo, bool concluida, int posicao,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class _$SubtaskModelCopyWithImpl<$Res>
    implements $SubtaskModelCopyWith<$Res> {
  _$SubtaskModelCopyWithImpl(this._self, this._then);

  final SubtaskModel _self;
  final $Res Function(SubtaskModel) _then;

/// Create a copy of SubtaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? task = null,Object? titulo = null,Object? concluida = null,Object? posicao = null,Object? criadoEm = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,concluida: null == concluida ? _self.concluida : concluida // ignore: cast_nullable_to_non_nullable
as bool,posicao: null == posicao ? _self.posicao : posicao // ignore: cast_nullable_to_non_nullable
as int,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubtaskModel].
extension SubtaskModelPatterns on SubtaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubtaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubtaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubtaskModel value)  $default,){
final _that = this;
switch (_that) {
case _SubtaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubtaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubtaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String task,  String titulo,  bool concluida,  int posicao, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubtaskModel() when $default != null:
return $default(_that.id,_that.task,_that.titulo,_that.concluida,_that.posicao,_that.criadoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String task,  String titulo,  bool concluida,  int posicao, @JsonKey(name: 'criado_em')  String criadoEm)  $default,) {final _that = this;
switch (_that) {
case _SubtaskModel():
return $default(_that.id,_that.task,_that.titulo,_that.concluida,_that.posicao,_that.criadoEm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String task,  String titulo,  bool concluida,  int posicao, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,) {final _that = this;
switch (_that) {
case _SubtaskModel() when $default != null:
return $default(_that.id,_that.task,_that.titulo,_that.concluida,_that.posicao,_that.criadoEm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubtaskModel extends SubtaskModel {
  const _SubtaskModel({required this.id, required this.task, required this.titulo, this.concluida = false, this.posicao = 0, @JsonKey(name: 'criado_em') required this.criadoEm}): super._();
  factory _SubtaskModel.fromJson(Map<String, dynamic> json) => _$SubtaskModelFromJson(json);

@override final  String id;
@override final  String task;
@override final  String titulo;
@override@JsonKey() final  bool concluida;
@override@JsonKey() final  int posicao;
@override@JsonKey(name: 'criado_em') final  String criadoEm;

/// Create a copy of SubtaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtaskModelCopyWith<_SubtaskModel> get copyWith => __$SubtaskModelCopyWithImpl<_SubtaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubtaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubtaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.concluida, concluida) || other.concluida == concluida)&&(identical(other.posicao, posicao) || other.posicao == posicao)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,titulo,concluida,posicao,criadoEm);

@override
String toString() {
  return 'SubtaskModel(id: $id, task: $task, titulo: $titulo, concluida: $concluida, posicao: $posicao, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class _$SubtaskModelCopyWith<$Res> implements $SubtaskModelCopyWith<$Res> {
  factory _$SubtaskModelCopyWith(_SubtaskModel value, $Res Function(_SubtaskModel) _then) = __$SubtaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String task, String titulo, bool concluida, int posicao,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class __$SubtaskModelCopyWithImpl<$Res>
    implements _$SubtaskModelCopyWith<$Res> {
  __$SubtaskModelCopyWithImpl(this._self, this._then);

  final _SubtaskModel _self;
  final $Res Function(_SubtaskModel) _then;

/// Create a copy of SubtaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? task = null,Object? titulo = null,Object? concluida = null,Object? posicao = null,Object? criadoEm = null,}) {
  return _then(_SubtaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,concluida: null == concluida ? _self.concluida : concluida // ignore: cast_nullable_to_non_nullable
as bool,posicao: null == posicao ? _self.posicao : posicao // ignore: cast_nullable_to_non_nullable
as int,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
