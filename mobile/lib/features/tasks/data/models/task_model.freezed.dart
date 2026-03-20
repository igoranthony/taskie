// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get id => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get prioridade =>
      throw _privateConstructorUsedError; // API returns FK int for criado_por; criado_por_username is the display value
  @JsonKey(name: 'criado_por_username')
  String get criadoPor => throw _privateConstructorUsedError; // API returns FK int for atribuido_para; atribuido_para_username is the display value
  // Raw FK int — used when sending to API
  @JsonKey(name: 'atribuido_para')
  int? get atribuidoParaId => throw _privateConstructorUsedError; // Display username — used for rendering
  @JsonKey(name: 'atribuido_para_username')
  String? get atribuidoPara => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_limite')
  String? get dataLimite => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  String get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  String get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call({
    String id,
    String titulo,
    String? descricao,
    String status,
    String prioridade,
    @JsonKey(name: 'criado_por_username') String criadoPor,
    @JsonKey(name: 'atribuido_para') int? atribuidoParaId,
    @JsonKey(name: 'atribuido_para_username') String? atribuidoPara,
    @JsonKey(name: 'data_limite') String? dataLimite,
    @JsonKey(name: 'criado_em') String criadoEm,
    @JsonKey(name: 'atualizado_em') String atualizadoEm,
  });
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? descricao = freezed,
    Object? status = null,
    Object? prioridade = null,
    Object? criadoPor = null,
    Object? atribuidoParaId = freezed,
    Object? atribuidoPara = freezed,
    Object? dataLimite = freezed,
    Object? criadoEm = null,
    Object? atualizadoEm = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            titulo: null == titulo
                ? _value.titulo
                : titulo // ignore: cast_nullable_to_non_nullable
                      as String,
            descricao: freezed == descricao
                ? _value.descricao
                : descricao // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            prioridade: null == prioridade
                ? _value.prioridade
                : prioridade // ignore: cast_nullable_to_non_nullable
                      as String,
            criadoPor: null == criadoPor
                ? _value.criadoPor
                : criadoPor // ignore: cast_nullable_to_non_nullable
                      as String,
            atribuidoParaId: freezed == atribuidoParaId
                ? _value.atribuidoParaId
                : atribuidoParaId // ignore: cast_nullable_to_non_nullable
                      as int?,
            atribuidoPara: freezed == atribuidoPara
                ? _value.atribuidoPara
                : atribuidoPara // ignore: cast_nullable_to_non_nullable
                      as String?,
            dataLimite: freezed == dataLimite
                ? _value.dataLimite
                : dataLimite // ignore: cast_nullable_to_non_nullable
                      as String?,
            criadoEm: null == criadoEm
                ? _value.criadoEm
                : criadoEm // ignore: cast_nullable_to_non_nullable
                      as String,
            atualizadoEm: null == atualizadoEm
                ? _value.atualizadoEm
                : atualizadoEm // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
    _$TaskModelImpl value,
    $Res Function(_$TaskModelImpl) then,
  ) = __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String titulo,
    String? descricao,
    String status,
    String prioridade,
    @JsonKey(name: 'criado_por_username') String criadoPor,
    @JsonKey(name: 'atribuido_para') int? atribuidoParaId,
    @JsonKey(name: 'atribuido_para_username') String? atribuidoPara,
    @JsonKey(name: 'data_limite') String? dataLimite,
    @JsonKey(name: 'criado_em') String criadoEm,
    @JsonKey(name: 'atualizado_em') String atualizadoEm,
  });
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
    _$TaskModelImpl _value,
    $Res Function(_$TaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titulo = null,
    Object? descricao = freezed,
    Object? status = null,
    Object? prioridade = null,
    Object? criadoPor = null,
    Object? atribuidoParaId = freezed,
    Object? atribuidoPara = freezed,
    Object? dataLimite = freezed,
    Object? criadoEm = null,
    Object? atualizadoEm = null,
  }) {
    return _then(
      _$TaskModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        titulo: null == titulo
            ? _value.titulo
            : titulo // ignore: cast_nullable_to_non_nullable
                  as String,
        descricao: freezed == descricao
            ? _value.descricao
            : descricao // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        prioridade: null == prioridade
            ? _value.prioridade
            : prioridade // ignore: cast_nullable_to_non_nullable
                  as String,
        criadoPor: null == criadoPor
            ? _value.criadoPor
            : criadoPor // ignore: cast_nullable_to_non_nullable
                  as String,
        atribuidoParaId: freezed == atribuidoParaId
            ? _value.atribuidoParaId
            : atribuidoParaId // ignore: cast_nullable_to_non_nullable
                  as int?,
        atribuidoPara: freezed == atribuidoPara
            ? _value.atribuidoPara
            : atribuidoPara // ignore: cast_nullable_to_non_nullable
                  as String?,
        dataLimite: freezed == dataLimite
            ? _value.dataLimite
            : dataLimite // ignore: cast_nullable_to_non_nullable
                  as String?,
        criadoEm: null == criadoEm
            ? _value.criadoEm
            : criadoEm // ignore: cast_nullable_to_non_nullable
                  as String,
        atualizadoEm: null == atualizadoEm
            ? _value.atualizadoEm
            : atualizadoEm // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl extends _TaskModel {
  const _$TaskModelImpl({
    required this.id,
    required this.titulo,
    this.descricao,
    required this.status,
    required this.prioridade,
    @JsonKey(name: 'criado_por_username') required this.criadoPor,
    @JsonKey(name: 'atribuido_para') this.atribuidoParaId,
    @JsonKey(name: 'atribuido_para_username') this.atribuidoPara,
    @JsonKey(name: 'data_limite') this.dataLimite,
    @JsonKey(name: 'criado_em') required this.criadoEm,
    @JsonKey(name: 'atualizado_em') required this.atualizadoEm,
  }) : super._();

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final String id;
  @override
  final String titulo;
  @override
  final String? descricao;
  @override
  final String status;
  @override
  final String prioridade;
  // API returns FK int for criado_por; criado_por_username is the display value
  @override
  @JsonKey(name: 'criado_por_username')
  final String criadoPor;
  // API returns FK int for atribuido_para; atribuido_para_username is the display value
  // Raw FK int — used when sending to API
  @override
  @JsonKey(name: 'atribuido_para')
  final int? atribuidoParaId;
  // Display username — used for rendering
  @override
  @JsonKey(name: 'atribuido_para_username')
  final String? atribuidoPara;
  @override
  @JsonKey(name: 'data_limite')
  final String? dataLimite;
  @override
  @JsonKey(name: 'criado_em')
  final String criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  final String atualizadoEm;

  @override
  String toString() {
    return 'TaskModel(id: $id, titulo: $titulo, descricao: $descricao, status: $status, prioridade: $prioridade, criadoPor: $criadoPor, atribuidoParaId: $atribuidoParaId, atribuidoPara: $atribuidoPara, dataLimite: $dataLimite, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.criadoPor, criadoPor) ||
                other.criadoPor == criadoPor) &&
            (identical(other.atribuidoParaId, atribuidoParaId) ||
                other.atribuidoParaId == atribuidoParaId) &&
            (identical(other.atribuidoPara, atribuidoPara) ||
                other.atribuidoPara == atribuidoPara) &&
            (identical(other.dataLimite, dataLimite) ||
                other.dataLimite == dataLimite) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                other.atualizadoEm == atualizadoEm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    titulo,
    descricao,
    status,
    prioridade,
    criadoPor,
    atribuidoParaId,
    atribuidoPara,
    dataLimite,
    criadoEm,
    atualizadoEm,
  );

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(this);
  }
}

abstract class _TaskModel extends TaskModel {
  const factory _TaskModel({
    required final String id,
    required final String titulo,
    final String? descricao,
    required final String status,
    required final String prioridade,
    @JsonKey(name: 'criado_por_username') required final String criadoPor,
    @JsonKey(name: 'atribuido_para') final int? atribuidoParaId,
    @JsonKey(name: 'atribuido_para_username') final String? atribuidoPara,
    @JsonKey(name: 'data_limite') final String? dataLimite,
    @JsonKey(name: 'criado_em') required final String criadoEm,
    @JsonKey(name: 'atualizado_em') required final String atualizadoEm,
  }) = _$TaskModelImpl;
  const _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  String get id;
  @override
  String get titulo;
  @override
  String? get descricao;
  @override
  String get status;
  @override
  String get prioridade; // API returns FK int for criado_por; criado_por_username is the display value
  @override
  @JsonKey(name: 'criado_por_username')
  String get criadoPor; // API returns FK int for atribuido_para; atribuido_para_username is the display value
  // Raw FK int — used when sending to API
  @override
  @JsonKey(name: 'atribuido_para')
  int? get atribuidoParaId; // Display username — used for rendering
  @override
  @JsonKey(name: 'atribuido_para_username')
  String? get atribuidoPara;
  @override
  @JsonKey(name: 'data_limite')
  String? get dataLimite;
  @override
  @JsonKey(name: 'criado_em')
  String get criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  String get atualizadoEm;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
