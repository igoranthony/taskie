// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttachmentModel {

 String get id; String get task;@JsonKey(name: 'arquivo_url') String get arquivoUrl;@JsonKey(name: 'nome_original') String get nomeOriginal;@JsonKey(name: 'mime_type') String? get mimeType;@JsonKey(name: 'tamanho_bytes') int? get tamanhoBytes;@JsonKey(name: 'criado_em') String get criadoEm;
/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttachmentModelCopyWith<AttachmentModel> get copyWith => _$AttachmentModelCopyWithImpl<AttachmentModel>(this as AttachmentModel, _$identity);

  /// Serializes this AttachmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttachmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.arquivoUrl, arquivoUrl) || other.arquivoUrl == arquivoUrl)&&(identical(other.nomeOriginal, nomeOriginal) || other.nomeOriginal == nomeOriginal)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.tamanhoBytes, tamanhoBytes) || other.tamanhoBytes == tamanhoBytes)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,arquivoUrl,nomeOriginal,mimeType,tamanhoBytes,criadoEm);

@override
String toString() {
  return 'AttachmentModel(id: $id, task: $task, arquivoUrl: $arquivoUrl, nomeOriginal: $nomeOriginal, mimeType: $mimeType, tamanhoBytes: $tamanhoBytes, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class $AttachmentModelCopyWith<$Res>  {
  factory $AttachmentModelCopyWith(AttachmentModel value, $Res Function(AttachmentModel) _then) = _$AttachmentModelCopyWithImpl;
@useResult
$Res call({
 String id, String task,@JsonKey(name: 'arquivo_url') String arquivoUrl,@JsonKey(name: 'nome_original') String nomeOriginal,@JsonKey(name: 'mime_type') String? mimeType,@JsonKey(name: 'tamanho_bytes') int? tamanhoBytes,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class _$AttachmentModelCopyWithImpl<$Res>
    implements $AttachmentModelCopyWith<$Res> {
  _$AttachmentModelCopyWithImpl(this._self, this._then);

  final AttachmentModel _self;
  final $Res Function(AttachmentModel) _then;

/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? task = null,Object? arquivoUrl = null,Object? nomeOriginal = null,Object? mimeType = freezed,Object? tamanhoBytes = freezed,Object? criadoEm = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,arquivoUrl: null == arquivoUrl ? _self.arquivoUrl : arquivoUrl // ignore: cast_nullable_to_non_nullable
as String,nomeOriginal: null == nomeOriginal ? _self.nomeOriginal : nomeOriginal // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,tamanhoBytes: freezed == tamanhoBytes ? _self.tamanhoBytes : tamanhoBytes // ignore: cast_nullable_to_non_nullable
as int?,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttachmentModel].
extension AttachmentModelPatterns on AttachmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttachmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttachmentModel value)  $default,){
final _that = this;
switch (_that) {
case _AttachmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttachmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String task, @JsonKey(name: 'arquivo_url')  String arquivoUrl, @JsonKey(name: 'nome_original')  String nomeOriginal, @JsonKey(name: 'mime_type')  String? mimeType, @JsonKey(name: 'tamanho_bytes')  int? tamanhoBytes, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
return $default(_that.id,_that.task,_that.arquivoUrl,_that.nomeOriginal,_that.mimeType,_that.tamanhoBytes,_that.criadoEm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String task, @JsonKey(name: 'arquivo_url')  String arquivoUrl, @JsonKey(name: 'nome_original')  String nomeOriginal, @JsonKey(name: 'mime_type')  String? mimeType, @JsonKey(name: 'tamanho_bytes')  int? tamanhoBytes, @JsonKey(name: 'criado_em')  String criadoEm)  $default,) {final _that = this;
switch (_that) {
case _AttachmentModel():
return $default(_that.id,_that.task,_that.arquivoUrl,_that.nomeOriginal,_that.mimeType,_that.tamanhoBytes,_that.criadoEm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String task, @JsonKey(name: 'arquivo_url')  String arquivoUrl, @JsonKey(name: 'nome_original')  String nomeOriginal, @JsonKey(name: 'mime_type')  String? mimeType, @JsonKey(name: 'tamanho_bytes')  int? tamanhoBytes, @JsonKey(name: 'criado_em')  String criadoEm)?  $default,) {final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
return $default(_that.id,_that.task,_that.arquivoUrl,_that.nomeOriginal,_that.mimeType,_that.tamanhoBytes,_that.criadoEm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttachmentModel extends AttachmentModel {
  const _AttachmentModel({required this.id, required this.task, @JsonKey(name: 'arquivo_url') required this.arquivoUrl, @JsonKey(name: 'nome_original') required this.nomeOriginal, @JsonKey(name: 'mime_type') this.mimeType, @JsonKey(name: 'tamanho_bytes') this.tamanhoBytes, @JsonKey(name: 'criado_em') required this.criadoEm}): super._();
  factory _AttachmentModel.fromJson(Map<String, dynamic> json) => _$AttachmentModelFromJson(json);

@override final  String id;
@override final  String task;
@override@JsonKey(name: 'arquivo_url') final  String arquivoUrl;
@override@JsonKey(name: 'nome_original') final  String nomeOriginal;
@override@JsonKey(name: 'mime_type') final  String? mimeType;
@override@JsonKey(name: 'tamanho_bytes') final  int? tamanhoBytes;
@override@JsonKey(name: 'criado_em') final  String criadoEm;

/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttachmentModelCopyWith<_AttachmentModel> get copyWith => __$AttachmentModelCopyWithImpl<_AttachmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttachmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttachmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.task, task) || other.task == task)&&(identical(other.arquivoUrl, arquivoUrl) || other.arquivoUrl == arquivoUrl)&&(identical(other.nomeOriginal, nomeOriginal) || other.nomeOriginal == nomeOriginal)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.tamanhoBytes, tamanhoBytes) || other.tamanhoBytes == tamanhoBytes)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,task,arquivoUrl,nomeOriginal,mimeType,tamanhoBytes,criadoEm);

@override
String toString() {
  return 'AttachmentModel(id: $id, task: $task, arquivoUrl: $arquivoUrl, nomeOriginal: $nomeOriginal, mimeType: $mimeType, tamanhoBytes: $tamanhoBytes, criadoEm: $criadoEm)';
}


}

/// @nodoc
abstract mixin class _$AttachmentModelCopyWith<$Res> implements $AttachmentModelCopyWith<$Res> {
  factory _$AttachmentModelCopyWith(_AttachmentModel value, $Res Function(_AttachmentModel) _then) = __$AttachmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String task,@JsonKey(name: 'arquivo_url') String arquivoUrl,@JsonKey(name: 'nome_original') String nomeOriginal,@JsonKey(name: 'mime_type') String? mimeType,@JsonKey(name: 'tamanho_bytes') int? tamanhoBytes,@JsonKey(name: 'criado_em') String criadoEm
});




}
/// @nodoc
class __$AttachmentModelCopyWithImpl<$Res>
    implements _$AttachmentModelCopyWith<$Res> {
  __$AttachmentModelCopyWithImpl(this._self, this._then);

  final _AttachmentModel _self;
  final $Res Function(_AttachmentModel) _then;

/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? task = null,Object? arquivoUrl = null,Object? nomeOriginal = null,Object? mimeType = freezed,Object? tamanhoBytes = freezed,Object? criadoEm = null,}) {
  return _then(_AttachmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,arquivoUrl: null == arquivoUrl ? _self.arquivoUrl : arquivoUrl // ignore: cast_nullable_to_non_nullable
as String,nomeOriginal: null == nomeOriginal ? _self.nomeOriginal : nomeOriginal // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,tamanhoBytes: freezed == tamanhoBytes ? _self.tamanhoBytes : tamanhoBytes // ignore: cast_nullable_to_non_nullable
as int?,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
