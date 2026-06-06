// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectModel {

 String get id; String get nome; String get cor;@JsonKey(name: 'logo_url') String? get logoUrl;@JsonKey(name: 'categoria') String? get categoriaId;@JsonKey(name: 'categoria_nome') String? get categoriaNome; String get status;@JsonKey(name: 'total_tasks') int get totalTasks;@JsonKey(name: 'done_tasks') int get doneTasks;@JsonKey(name: 'is_owner') bool get isOwner;@JsonKey(name: 'invite_code') String? get inviteCode;@JsonKey(name: 'pending_members_count') int get pendingMembersCount;@JsonKey(name: 'criado_em') String get criadoEm;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.cor, cor) || other.cor == cor)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId)&&(identical(other.categoriaNome, categoriaNome) || other.categoriaNome == categoriaNome)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalTasks, totalTasks) || other.totalTasks == totalTasks)&&(identical(other.doneTasks, doneTasks) || other.doneTasks == doneTasks)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.pendingMembersCount, pendingMembersCount) || other.pendingMembersCount == pendingMembersCount)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,cor,logoUrl,categoriaId,categoriaNome,status,totalTasks,doneTasks,isOwner,inviteCode,pendingMembersCount,criadoEm);

@override
String toString() {
  return 'ProjectModel(id: $id, nome: $nome, cor: $cor, logoUrl: $logoUrl, categoriaId: $categoriaId, categoriaNome: $categoriaNome, status: $status, totalTasks: $totalTasks, doneTasks: $doneTasks, isOwner: $isOwner, inviteCode: $inviteCode, pendingMembersCount: $pendingMembersCount, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String nome, String cor,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'categoria') String? categoriaId,@JsonKey(name: 'categoria_nome') String? categoriaNome, String status,@JsonKey(name: 'total_tasks') int totalTasks,@JsonKey(name: 'done_tasks') int doneTasks,@JsonKey(name: 'is_owner') bool isOwner,@JsonKey(name: 'invite_code') String? inviteCode,@JsonKey(name: 'pending_members_count') int pendingMembersCount,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nome = null,Object? cor = null,Object? logoUrl = freezed,Object? categoriaId = freezed,Object? categoriaNome = freezed,Object? status = null,Object? totalTasks = null,Object? doneTasks = null,Object? isOwner = null,Object? inviteCode = freezed,Object? pendingMembersCount = null,Object? criadoEm = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,cor: null == cor ? _self.cor : cor // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,categoriaId: freezed == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String?,categoriaNome: freezed == categoriaNome ? _self.categoriaNome : categoriaNome // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalTasks: null == totalTasks ? _self.totalTasks : totalTasks // ignore: cast_nullable_to_non_nullable
as int,doneTasks: null == doneTasks ? _self.doneTasks : doneTasks // ignore: cast_nullable_to_non_nullable
as int,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,pendingMembersCount: null == pendingMembersCount ? _self.pendingMembersCount : pendingMembersCount // ignore: cast_nullable_to_non_nullable
as int,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nome,  String cor, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'categoria')  String? categoriaId, @JsonKey(name: 'categoria_nome')  String? categoriaNome,  String status, @JsonKey(name: 'total_tasks')  int totalTasks, @JsonKey(name: 'done_tasks')  int doneTasks, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'invite_code')  String? inviteCode, @JsonKey(name: 'pending_members_count')  int pendingMembersCount, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.nome,_that.cor,_that.logoUrl,_that.categoriaId,_that.categoriaNome,_that.status,_that.totalTasks,_that.doneTasks,_that.isOwner,_that.inviteCode,_that.pendingMembersCount,_that.criadoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nome,  String cor, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'categoria')  String? categoriaId, @JsonKey(name: 'categoria_nome')  String? categoriaNome,  String status, @JsonKey(name: 'total_tasks')  int totalTasks, @JsonKey(name: 'done_tasks')  int doneTasks, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'invite_code')  String? inviteCode, @JsonKey(name: 'pending_members_count')  int pendingMembersCount, @JsonKey(name: 'criado_em')  String criadoEm)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.id,_that.nome,_that.cor,_that.logoUrl,_that.categoriaId,_that.categoriaNome,_that.status,_that.totalTasks,_that.doneTasks,_that.isOwner,_that.inviteCode,_that.pendingMembersCount,_that.criadoEm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nome,  String cor, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'categoria')  String? categoriaId, @JsonKey(name: 'categoria_nome')  String? categoriaNome,  String status, @JsonKey(name: 'total_tasks')  int totalTasks, @JsonKey(name: 'done_tasks')  int doneTasks, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'invite_code')  String? inviteCode, @JsonKey(name: 'pending_members_count')  int pendingMembersCount, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.nome,_that.cor,_that.logoUrl,_that.categoriaId,_that.categoriaNome,_that.status,_that.totalTasks,_that.doneTasks,_that.isOwner,_that.inviteCode,_that.pendingMembersCount,_that.criadoEm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel extends ProjectModel {
  const _ProjectModel({required this.id, required this.nome, required this.cor, @JsonKey(name: 'logo_url') this.logoUrl, @JsonKey(name: 'categoria') this.categoriaId, @JsonKey(name: 'categoria_nome') this.categoriaNome, required this.status, @JsonKey(name: 'total_tasks') this.totalTasks = 0, @JsonKey(name: 'done_tasks') this.doneTasks = 0, @JsonKey(name: 'is_owner') this.isOwner = false, @JsonKey(name: 'invite_code') this.inviteCode, @JsonKey(name: 'pending_members_count') this.pendingMembersCount = 0, @JsonKey(name: 'criado_em') required this.criadoEm}): super._();
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  String id;
@override final  String nome;
@override final  String cor;
@override@JsonKey(name: 'logo_url') final  String? logoUrl;
@override@JsonKey(name: 'categoria') final  String? categoriaId;
@override@JsonKey(name: 'categoria_nome') final  String? categoriaNome;
@override final  String status;
@override@JsonKey(name: 'total_tasks') final  int totalTasks;
@override@JsonKey(name: 'done_tasks') final  int doneTasks;
@override@JsonKey(name: 'is_owner') final  bool isOwner;
@override@JsonKey(name: 'invite_code') final  String? inviteCode;
@override@JsonKey(name: 'pending_members_count') final  int pendingMembersCount;
@override@JsonKey(name: 'criado_em') final  String criadoEm;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.cor, cor) || other.cor == cor)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId)&&(identical(other.categoriaNome, categoriaNome) || other.categoriaNome == categoriaNome)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalTasks, totalTasks) || other.totalTasks == totalTasks)&&(identical(other.doneTasks, doneTasks) || other.doneTasks == doneTasks)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.pendingMembersCount, pendingMembersCount) || other.pendingMembersCount == pendingMembersCount)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,cor,logoUrl,categoriaId,categoriaNome,status,totalTasks,doneTasks,isOwner,inviteCode,pendingMembersCount,criadoEm);

@override
String toString() {
  return 'ProjectModel(id: $id, nome: $nome, cor: $cor, logoUrl: $logoUrl, categoriaId: $categoriaId, categoriaNome: $categoriaNome, status: $status, totalTasks: $totalTasks, doneTasks: $doneTasks, isOwner: $isOwner, inviteCode: $inviteCode, pendingMembersCount: $pendingMembersCount, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nome, String cor,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'categoria') String? categoriaId,@JsonKey(name: 'categoria_nome') String? categoriaNome, String status,@JsonKey(name: 'total_tasks') int totalTasks,@JsonKey(name: 'done_tasks') int doneTasks,@JsonKey(name: 'is_owner') bool isOwner,@JsonKey(name: 'invite_code') String? inviteCode,@JsonKey(name: 'pending_members_count') int pendingMembersCount,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nome = null,Object? cor = null,Object? logoUrl = freezed,Object? categoriaId = freezed,Object? categoriaNome = freezed,Object? status = null,Object? totalTasks = null,Object? doneTasks = null,Object? isOwner = null,Object? inviteCode = freezed,Object? pendingMembersCount = null,Object? criadoEm = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,cor: null == cor ? _self.cor : cor // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,categoriaId: freezed == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String?,categoriaNome: freezed == categoriaNome ? _self.categoriaNome : categoriaNome // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalTasks: null == totalTasks ? _self.totalTasks : totalTasks // ignore: cast_nullable_to_non_nullable
as int,doneTasks: null == doneTasks ? _self.doneTasks : doneTasks // ignore: cast_nullable_to_non_nullable
as int,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,pendingMembersCount: null == pendingMembersCount ? _self.pendingMembersCount : pendingMembersCount // ignore: cast_nullable_to_non_nullable
as int,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
