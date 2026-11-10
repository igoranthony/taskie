// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectMemberModel {

 String get id; int get usuario; String get username; String get email; String get status;@JsonKey(name: 'criado_em') String get criadoEm;
/// Create a copy of ProjectMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectMemberModelCopyWith<ProjectMemberModel> get copyWith => _$ProjectMemberModelCopyWithImpl<ProjectMemberModel>(this as ProjectMemberModel, _$identity);

  /// Serializes this ProjectMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,usuario,username,email,status,criadoEm);

@override
String toString() {
  return 'ProjectMemberModel(id: $id, usuario: $usuario, username: $username, email: $email, status: $status, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class $ProjectMemberModelCopyWith<$Res>  {
  factory $ProjectMemberModelCopyWith(ProjectMemberModel value, $Res Function(ProjectMemberModel) _then) = _$ProjectMemberModelCopyWithImpl;
@useResult
$Res call({
 String id, int usuario, String username, String email, String status,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class _$ProjectMemberModelCopyWithImpl<$Res>
    implements $ProjectMemberModelCopyWith<$Res> {
  _$ProjectMemberModelCopyWithImpl(this._self, this._then);

  final ProjectMemberModel _self;
  final $Res Function(ProjectMemberModel) _then;

/// Create a copy of ProjectMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? usuario = null,Object? username = null,Object? email = null,Object? status = null,Object? criadoEm = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectMemberModel].
extension ProjectMemberModelPatterns on ProjectMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int usuario,  String username,  String email,  String status, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectMemberModel() when $default != null:
return $default(_that.id,_that.usuario,_that.username,_that.email,_that.status,_that.criadoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int usuario,  String username,  String email,  String status, @JsonKey(name: 'criado_em')  String criadoEm)  $default,) {final _that = this;
switch (_that) {
case _ProjectMemberModel():
return $default(_that.id,_that.usuario,_that.username,_that.email,_that.status,_that.criadoEm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int usuario,  String username,  String email,  String status, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,) {final _that = this;
switch (_that) {
case _ProjectMemberModel() when $default != null:
return $default(_that.id,_that.usuario,_that.username,_that.email,_that.status,_that.criadoEm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectMemberModel extends ProjectMemberModel {
  const _ProjectMemberModel({required this.id, required this.usuario, required this.username, this.email = '', required this.status, @JsonKey(name: 'criado_em') required this.criadoEm}): super._();
  factory _ProjectMemberModel.fromJson(Map<String, dynamic> json) => _$ProjectMemberModelFromJson(json);

@override final  String id;
@override final  int usuario;
@override final  String username;
@override@JsonKey() final  String email;
@override final  String status;
@override@JsonKey(name: 'criado_em') final  String criadoEm;

/// Create a copy of ProjectMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectMemberModelCopyWith<_ProjectMemberModel> get copyWith => __$ProjectMemberModelCopyWithImpl<_ProjectMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.status, status) || other.status == status)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,usuario,username,email,status,criadoEm);

@override
String toString() {
  return 'ProjectMemberModel(id: $id, usuario: $usuario, username: $username, email: $email, status: $status, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class _$ProjectMemberModelCopyWith<$Res> implements $ProjectMemberModelCopyWith<$Res> {
  factory _$ProjectMemberModelCopyWith(_ProjectMemberModel value, $Res Function(_ProjectMemberModel) _then) = __$ProjectMemberModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int usuario, String username, String email, String status,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class __$ProjectMemberModelCopyWithImpl<$Res>
    implements _$ProjectMemberModelCopyWith<$Res> {
  __$ProjectMemberModelCopyWithImpl(this._self, this._then);

  final _ProjectMemberModel _self;
  final $Res Function(_ProjectMemberModel) _then;

/// Create a copy of ProjectMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? usuario = null,Object? username = null,Object? email = null,Object? status = null,Object? criadoEm = null,}) {
  return _then(_ProjectMemberModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
