// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskModel {

 String get id; String get titulo; String? get descricao; String get status; String get prioridade;// API returns FK int for criado_por; criado_por_username is the display value
@JsonKey(name: 'criado_por_username') String get criadoPor;// API returns FK int for atribuido_para; atribuido_para_username is the display value
// Raw FK int — used when sending to API
@JsonKey(name: 'atribuido_para') int? get atribuidoParaId;// Display username — used for rendering
@JsonKey(name: 'atribuido_para_username') String? get atribuidoPara;@JsonKey(name: 'data_limite') String? get dataLimite;@JsonKey(name: 'criado_em') String get criadoEm;@JsonKey(name: 'atualizado_em') String get atualizadoEm;@JsonKey(name: 'can_edit') bool get canEdit;@JsonKey(name: 'projeto') String? get projetoId;@JsonKey(name: 'coluna') String? get colunaId; List<SubtaskModel> get subtarefas; List<AttachmentModel> get anexos;
/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskModelCopyWith<TaskModel> get copyWith => _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.status, status) || other.status == status)&&(identical(other.prioridade, prioridade) || other.prioridade == prioridade)&&(identical(other.criadoPor, criadoPor) || other.criadoPor == criadoPor)&&(identical(other.atribuidoParaId, atribuidoParaId) || other.atribuidoParaId == atribuidoParaId)&&(identical(other.atribuidoPara, atribuidoPara) || other.atribuidoPara == atribuidoPara)&&(identical(other.dataLimite, dataLimite) || other.dataLimite == dataLimite)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm)&&(identical(other.atualizadoEm, atualizadoEm) || other.atualizadoEm == atualizadoEm)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.projetoId, projetoId) || other.projetoId == projetoId)&&(identical(other.colunaId, colunaId) || other.colunaId == colunaId)&&const DeepCollectionEquality().equals(other.subtarefas, subtarefas)&&const DeepCollectionEquality().equals(other.anexos, anexos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descricao,status,prioridade,criadoPor,atribuidoParaId,atribuidoPara,dataLimite,criadoEm,atualizadoEm,canEdit,projetoId,colunaId,const DeepCollectionEquality().hash(subtarefas),const DeepCollectionEquality().hash(anexos));

@override
String toString() {
  return 'TaskModel(id: $id, titulo: $titulo, descricao: $descricao, status: $status, prioridade: $prioridade, criadoPor: $criadoPor, atribuidoParaId: $atribuidoParaId, atribuidoPara: $atribuidoPara, dataLimite: $dataLimite, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm, canEdit: $canEdit, projetoId: $projetoId, colunaId: $colunaId, subtarefas: $subtarefas, anexos: $anexos)';
}


}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res>  {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) = _$TaskModelCopyWithImpl;
@useResult
$Res call({
 String id, String titulo, String? descricao, String status, String prioridade,@JsonKey(name: 'criado_por_username') String criadoPor,@JsonKey(name: 'atribuido_para') int? atribuidoParaId,@JsonKey(name: 'atribuido_para_username') String? atribuidoPara,@JsonKey(name: 'data_limite') String? dataLimite,@JsonKey(name: 'criado_em') String criadoEm,@JsonKey(name: 'atualizado_em') String atualizadoEm,@JsonKey(name: 'can_edit') bool canEdit,@JsonKey(name: 'projeto') String? projetoId,@JsonKey(name: 'coluna') String? colunaId, List<SubtaskModel> subtarefas, List<AttachmentModel> anexos
});




}
/// @nodoc
class _$TaskModelCopyWithImpl<$Res>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titulo = null,Object? descricao = freezed,Object? status = null,Object? prioridade = null,Object? criadoPor = null,Object? atribuidoParaId = freezed,Object? atribuidoPara = freezed,Object? dataLimite = freezed,Object? criadoEm = null,Object? atualizadoEm = null,Object? canEdit = null,Object? projetoId = freezed,Object? colunaId = freezed,Object? subtarefas = null,Object? anexos = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,prioridade: null == prioridade ? _self.prioridade : prioridade // ignore: cast_nullable_to_non_nullable
as String,criadoPor: null == criadoPor ? _self.criadoPor : criadoPor // ignore: cast_nullable_to_non_nullable
as String,atribuidoParaId: freezed == atribuidoParaId ? _self.atribuidoParaId : atribuidoParaId // ignore: cast_nullable_to_non_nullable
as int?,atribuidoPara: freezed == atribuidoPara ? _self.atribuidoPara : atribuidoPara // ignore: cast_nullable_to_non_nullable
as String?,dataLimite: freezed == dataLimite ? _self.dataLimite : dataLimite // ignore: cast_nullable_to_non_nullable
as String?,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,atualizadoEm: null == atualizadoEm ? _self.atualizadoEm : atualizadoEm // ignore: cast_nullable_to_non_nullable
as String,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,projetoId: freezed == projetoId ? _self.projetoId : projetoId // ignore: cast_nullable_to_non_nullable
as String?,colunaId: freezed == colunaId ? _self.colunaId : colunaId // ignore: cast_nullable_to_non_nullable
as String?,subtarefas: null == subtarefas ? _self.subtarefas : subtarefas // ignore: cast_nullable_to_non_nullable
as List<SubtaskModel>,anexos: null == anexos ? _self.anexos : anexos // ignore: cast_nullable_to_non_nullable
as List<AttachmentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskModel].
extension TaskModelPatterns on TaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titulo,  String? descricao,  String status,  String prioridade, @JsonKey(name: 'criado_por_username')  String criadoPor, @JsonKey(name: 'atribuido_para')  int? atribuidoParaId, @JsonKey(name: 'atribuido_para_username')  String? atribuidoPara, @JsonKey(name: 'data_limite')  String? dataLimite, @JsonKey(name: 'criado_em')  String criadoEm, @JsonKey(name: 'atualizado_em')  String atualizadoEm, @JsonKey(name: 'can_edit')  bool canEdit, @JsonKey(name: 'projeto')  String? projetoId, @JsonKey(name: 'coluna')  String? colunaId,  List<SubtaskModel> subtarefas,  List<AttachmentModel> anexos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descricao,_that.status,_that.prioridade,_that.criadoPor,_that.atribuidoParaId,_that.atribuidoPara,_that.dataLimite,_that.criadoEm,_that.atualizadoEm,_that.canEdit,_that.projetoId,_that.colunaId,_that.subtarefas,_that.anexos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titulo,  String? descricao,  String status,  String prioridade, @JsonKey(name: 'criado_por_username')  String criadoPor, @JsonKey(name: 'atribuido_para')  int? atribuidoParaId, @JsonKey(name: 'atribuido_para_username')  String? atribuidoPara, @JsonKey(name: 'data_limite')  String? dataLimite, @JsonKey(name: 'criado_em')  String criadoEm, @JsonKey(name: 'atualizado_em')  String atualizadoEm, @JsonKey(name: 'can_edit')  bool canEdit, @JsonKey(name: 'projeto')  String? projetoId, @JsonKey(name: 'coluna')  String? colunaId,  List<SubtaskModel> subtarefas,  List<AttachmentModel> anexos)  $default,) {final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that.id,_that.titulo,_that.descricao,_that.status,_that.prioridade,_that.criadoPor,_that.atribuidoParaId,_that.atribuidoPara,_that.dataLimite,_that.criadoEm,_that.atualizadoEm,_that.canEdit,_that.projetoId,_that.colunaId,_that.subtarefas,_that.anexos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titulo,  String? descricao,  String status,  String prioridade, @JsonKey(name: 'criado_por_username')  String criadoPor, @JsonKey(name: 'atribuido_para')  int? atribuidoParaId, @JsonKey(name: 'atribuido_para_username')  String? atribuidoPara, @JsonKey(name: 'data_limite')  String? dataLimite, @JsonKey(name: 'criado_em')  String criadoEm, @JsonKey(name: 'atualizado_em')  String atualizadoEm, @JsonKey(name: 'can_edit')  bool canEdit, @JsonKey(name: 'projeto')  String? projetoId, @JsonKey(name: 'coluna')  String? colunaId,  List<SubtaskModel> subtarefas,  List<AttachmentModel> anexos)?  $default,) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descricao,_that.status,_that.prioridade,_that.criadoPor,_that.atribuidoParaId,_that.atribuidoPara,_that.dataLimite,_that.criadoEm,_that.atualizadoEm,_that.canEdit,_that.projetoId,_that.colunaId,_that.subtarefas,_that.anexos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskModel extends TaskModel {
  const _TaskModel({required this.id, required this.titulo, this.descricao, required this.status, required this.prioridade, @JsonKey(name: 'criado_por_username') required this.criadoPor, @JsonKey(name: 'atribuido_para') this.atribuidoParaId, @JsonKey(name: 'atribuido_para_username') this.atribuidoPara, @JsonKey(name: 'data_limite') this.dataLimite, @JsonKey(name: 'criado_em') required this.criadoEm, @JsonKey(name: 'atualizado_em') required this.atualizadoEm, @JsonKey(name: 'can_edit') this.canEdit = false, @JsonKey(name: 'projeto') this.projetoId, @JsonKey(name: 'coluna') this.colunaId, final  List<SubtaskModel> subtarefas = const [], final  List<AttachmentModel> anexos = const []}): _subtarefas = subtarefas,_anexos = anexos,super._();
  factory _TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

@override final  String id;
@override final  String titulo;
@override final  String? descricao;
@override final  String status;
@override final  String prioridade;
// API returns FK int for criado_por; criado_por_username is the display value
@override@JsonKey(name: 'criado_por_username') final  String criadoPor;
// API returns FK int for atribuido_para; atribuido_para_username is the display value
// Raw FK int — used when sending to API
@override@JsonKey(name: 'atribuido_para') final  int? atribuidoParaId;
// Display username — used for rendering
@override@JsonKey(name: 'atribuido_para_username') final  String? atribuidoPara;
@override@JsonKey(name: 'data_limite') final  String? dataLimite;
@override@JsonKey(name: 'criado_em') final  String criadoEm;
@override@JsonKey(name: 'atualizado_em') final  String atualizadoEm;
@override@JsonKey(name: 'can_edit') final  bool canEdit;
@override@JsonKey(name: 'projeto') final  String? projetoId;
@override@JsonKey(name: 'coluna') final  String? colunaId;
 final  List<SubtaskModel> _subtarefas;
@override@JsonKey() List<SubtaskModel> get subtarefas {
  if (_subtarefas is EqualUnmodifiableListView) return _subtarefas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtarefas);
}

 final  List<AttachmentModel> _anexos;
@override@JsonKey() List<AttachmentModel> get anexos {
  if (_anexos is EqualUnmodifiableListView) return _anexos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_anexos);
}


/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskModelCopyWith<_TaskModel> get copyWith => __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.status, status) || other.status == status)&&(identical(other.prioridade, prioridade) || other.prioridade == prioridade)&&(identical(other.criadoPor, criadoPor) || other.criadoPor == criadoPor)&&(identical(other.atribuidoParaId, atribuidoParaId) || other.atribuidoParaId == atribuidoParaId)&&(identical(other.atribuidoPara, atribuidoPara) || other.atribuidoPara == atribuidoPara)&&(identical(other.dataLimite, dataLimite) || other.dataLimite == dataLimite)&&(identical(other.criadoEm, criadoEm) || other.criadoEm == criadoEm)&&(identical(other.atualizadoEm, atualizadoEm) || other.atualizadoEm == atualizadoEm)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.projetoId, projetoId) || other.projetoId == projetoId)&&(identical(other.colunaId, colunaId) || other.colunaId == colunaId)&&const DeepCollectionEquality().equals(other._subtarefas, _subtarefas)&&const DeepCollectionEquality().equals(other._anexos, _anexos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descricao,status,prioridade,criadoPor,atribuidoParaId,atribuidoPara,dataLimite,criadoEm,atualizadoEm,canEdit,projetoId,colunaId,const DeepCollectionEquality().hash(_subtarefas),const DeepCollectionEquality().hash(_anexos));

@override
String toString() {
  return 'TaskModel(id: $id, titulo: $titulo, descricao: $descricao, status: $status, prioridade: $prioridade, criadoPor: $criadoPor, atribuidoParaId: $atribuidoParaId, atribuidoPara: $atribuidoPara, dataLimite: $dataLimite, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm, canEdit: $canEdit, projetoId: $projetoId, colunaId: $colunaId, subtarefas: $subtarefas, anexos: $anexos)';
}


}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(_TaskModel value, $Res Function(_TaskModel) _then) = __$TaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titulo, String? descricao, String status, String prioridade,@JsonKey(name: 'criado_por_username') String criadoPor,@JsonKey(name: 'atribuido_para') int? atribuidoParaId,@JsonKey(name: 'atribuido_para_username') String? atribuidoPara,@JsonKey(name: 'data_limite') String? dataLimite,@JsonKey(name: 'criado_em') String criadoEm,@JsonKey(name: 'atualizado_em') String atualizadoEm,@JsonKey(name: 'can_edit') bool canEdit,@JsonKey(name: 'projeto') String? projetoId,@JsonKey(name: 'coluna') String? colunaId, List<SubtaskModel> subtarefas, List<AttachmentModel> anexos
});




}
/// @nodoc
class __$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? descricao = freezed,Object? status = null,Object? prioridade = null,Object? criadoPor = null,Object? atribuidoParaId = freezed,Object? atribuidoPara = freezed,Object? dataLimite = freezed,Object? criadoEm = null,Object? atualizadoEm = null,Object? canEdit = null,Object? projetoId = freezed,Object? colunaId = freezed,Object? subtarefas = null,Object? anexos = null,}) {
  return _then(_TaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descricao: freezed == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,prioridade: null == prioridade ? _self.prioridade : prioridade // ignore: cast_nullable_to_non_nullable
as String,criadoPor: null == criadoPor ? _self.criadoPor : criadoPor // ignore: cast_nullable_to_non_nullable
as String,atribuidoParaId: freezed == atribuidoParaId ? _self.atribuidoParaId : atribuidoParaId // ignore: cast_nullable_to_non_nullable
as int?,atribuidoPara: freezed == atribuidoPara ? _self.atribuidoPara : atribuidoPara // ignore: cast_nullable_to_non_nullable
as String?,dataLimite: freezed == dataLimite ? _self.dataLimite : dataLimite // ignore: cast_nullable_to_non_nullable
as String?,criadoEm: null == criadoEm ? _self.criadoEm : criadoEm // ignore: cast_nullable_to_non_nullable
as String,atualizadoEm: null == atualizadoEm ? _self.atualizadoEm : atualizadoEm // ignore: cast_nullable_to_non_nullable
as String,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,projetoId: freezed == projetoId ? _self.projetoId : projetoId // ignore: cast_nullable_to_non_nullable
as String?,colunaId: freezed == colunaId ? _self.colunaId : colunaId // ignore: cast_nullable_to_non_nullable
as String?,subtarefas: null == subtarefas ? _self._subtarefas : subtarefas // ignore: cast_nullable_to_non_nullable
as List<SubtaskModel>,anexos: null == anexos ? _self._anexos : anexos // ignore: cast_nullable_to_non_nullable
as List<AttachmentModel>,
  ));
}


}

// dart format on
