// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_column_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectColumnModel {

 String get id; String get nome; int get posicao;@JsonKey(name: 'is_done_column') bool get isDoneColumn;
/// Create a copy of ProjectColumnModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectColumnModelCopyWith<ProjectColumnModel> get copyWith => _$ProjectColumnModelCopyWithImpl<ProjectColumnModel>(this as ProjectColumnModel, _$identity);

  /// Serializes this ProjectColumnModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectColumnModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.posicao, posicao) || other.posicao == posicao)&&(identical(other.isDoneColumn, isDoneColumn) || other.isDoneColumn == isDoneColumn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,posicao,isDoneColumn);

@override
String toString() {
  return 'ProjectColumnModel(id: $id, nome: $nome, posicao: $posicao, isDoneColumn: $isDoneColumn)';
}


}

/// @nodoc
abstract mixin class $ProjectColumnModelCopyWith<$Res>  {
  factory $ProjectColumnModelCopyWith(ProjectColumnModel value, $Res Function(ProjectColumnModel) _then) = _$ProjectColumnModelCopyWithImpl;
@useResult
$Res call({
 String id, String nome, int posicao,@JsonKey(name: 'is_done_column') bool isDoneColumn
});




}
/// @nodoc
class _$ProjectColumnModelCopyWithImpl<$Res>
    implements $ProjectColumnModelCopyWith<$Res> {
  _$ProjectColumnModelCopyWithImpl(this._self, this._then);

  final ProjectColumnModel _self;
  final $Res Function(ProjectColumnModel) _then;

/// Create a copy of ProjectColumnModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? posicao = null,Object? isDoneColumn = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,posicao: null == posicao ? _self.posicao : posicao // ignore: cast_nullable_to_non_nullable
as int,isDoneColumn: null == isDoneColumn ? _self.isDoneColumn : isDoneColumn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectColumnModel].
extension ProjectColumnModelPatterns on ProjectColumnModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectColumnModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectColumnModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectColumnModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectColumnModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectColumnModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectColumnModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nome,  int posicao, @JsonKey(name: 'is_done_column')  bool isDoneColumn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectColumnModel() when $default != null:
return $default(_that.id,_that.nome,_that.posicao,_that.isDoneColumn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nome,  int posicao, @JsonKey(name: 'is_done_column')  bool isDoneColumn)  $default,) {final _that = this;
switch (_that) {
case _ProjectColumnModel():
return $default(_that.id,_that.nome,_that.posicao,_that.isDoneColumn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nome,  int posicao, @JsonKey(name: 'is_done_column')  bool isDoneColumn)?  $default,) {final _that = this;
switch (_that) {
case _ProjectColumnModel() when $default != null:
return $default(_that.id,_that.nome,_that.posicao,_that.isDoneColumn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectColumnModel extends ProjectColumnModel {
  const _ProjectColumnModel({required this.id, required this.nome, this.posicao = 0, @JsonKey(name: 'is_done_column') this.isDoneColumn = false}): super._();
  factory _ProjectColumnModel.fromJson(Map<String, dynamic> json) => _$ProjectColumnModelFromJson(json);

@override final  String id;
@override final  String nome;
@override@JsonKey() final  int posicao;
@override@JsonKey(name: 'is_done_column') final  bool isDoneColumn;

/// Create a copy of ProjectColumnModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectColumnModelCopyWith<_ProjectColumnModel> get copyWith => __$ProjectColumnModelCopyWithImpl<_ProjectColumnModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectColumnModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectColumnModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.posicao, posicao) || other.posicao == posicao)&&(identical(other.isDoneColumn, isDoneColumn) || other.isDoneColumn == isDoneColumn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,posicao,isDoneColumn);

@override
String toString() {
  return 'ProjectColumnModel(id: $id, nome: $nome, posicao: $posicao, isDoneColumn: $isDoneColumn)';
}


}

/// @nodoc
abstract mixin class _$ProjectColumnModelCopyWith<$Res> implements $ProjectColumnModelCopyWith<$Res> {
  factory _$ProjectColumnModelCopyWith(_ProjectColumnModel value, $Res Function(_ProjectColumnModel) _then) = __$ProjectColumnModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nome, int posicao,@JsonKey(name: 'is_done_column') bool isDoneColumn
});




}
/// @nodoc
class __$ProjectColumnModelCopyWithImpl<$Res>
    implements _$ProjectColumnModelCopyWith<$Res> {
  __$ProjectColumnModelCopyWithImpl(this._self, this._then);

  final _ProjectColumnModel _self;
  final $Res Function(_ProjectColumnModel) _then;

/// Create a copy of ProjectColumnModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? posicao = null,Object? isDoneColumn = null,}) {
  return _then(_ProjectColumnModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,posicao: null == posicao ? _self.posicao : posicao // ignore: cast_nullable_to_non_nullable
as int,isDoneColumn: null == isDoneColumn ? _self.isDoneColumn : isDoneColumn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
