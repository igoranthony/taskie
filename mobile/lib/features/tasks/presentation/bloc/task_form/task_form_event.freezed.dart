// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskFormEvent {
  Task? get initialTask => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  TaskPriority get prioridade => throw _privateConstructorUsedError;
  int? get atribuidoPara => throw _privateConstructorUsedError;
  DateTime? get dataLimite => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Task? initialTask,
      String titulo,
      String? descricao,
      TaskStatus status,
      TaskPriority prioridade,
      int? atribuidoPara,
      DateTime? dataLimite,
    )
    submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Task? initialTask,
      String titulo,
      String? descricao,
      TaskStatus status,
      TaskPriority prioridade,
      int? atribuidoPara,
      DateTime? dataLimite,
    )?
    submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Task? initialTask,
      String titulo,
      String? descricao,
      TaskStatus status,
      TaskPriority prioridade,
      int? atribuidoPara,
      DateTime? dataLimite,
    )?
    submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFormSubmitted value) submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormSubmitted value)? submitted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormSubmitted value)? submitted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of TaskFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskFormEventCopyWith<TaskFormEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFormEventCopyWith<$Res> {
  factory $TaskFormEventCopyWith(
    TaskFormEvent value,
    $Res Function(TaskFormEvent) then,
  ) = _$TaskFormEventCopyWithImpl<$Res, TaskFormEvent>;
  @useResult
  $Res call({
    Task? initialTask,
    String titulo,
    String? descricao,
    TaskStatus status,
    TaskPriority prioridade,
    int? atribuidoPara,
    DateTime? dataLimite,
  });
}

/// @nodoc
class _$TaskFormEventCopyWithImpl<$Res, $Val extends TaskFormEvent>
    implements $TaskFormEventCopyWith<$Res> {
  _$TaskFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialTask = freezed,
    Object? titulo = null,
    Object? descricao = freezed,
    Object? status = null,
    Object? prioridade = null,
    Object? atribuidoPara = freezed,
    Object? dataLimite = freezed,
  }) {
    return _then(
      _value.copyWith(
            initialTask: freezed == initialTask
                ? _value.initialTask
                : initialTask // ignore: cast_nullable_to_non_nullable
                      as Task?,
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
                      as TaskStatus,
            prioridade: null == prioridade
                ? _value.prioridade
                : prioridade // ignore: cast_nullable_to_non_nullable
                      as TaskPriority,
            atribuidoPara: freezed == atribuidoPara
                ? _value.atribuidoPara
                : atribuidoPara // ignore: cast_nullable_to_non_nullable
                      as int?,
            dataLimite: freezed == dataLimite
                ? _value.dataLimite
                : dataLimite // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskFormSubmittedImplCopyWith<$Res>
    implements $TaskFormEventCopyWith<$Res> {
  factory _$$TaskFormSubmittedImplCopyWith(
    _$TaskFormSubmittedImpl value,
    $Res Function(_$TaskFormSubmittedImpl) then,
  ) = __$$TaskFormSubmittedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Task? initialTask,
    String titulo,
    String? descricao,
    TaskStatus status,
    TaskPriority prioridade,
    int? atribuidoPara,
    DateTime? dataLimite,
  });
}

/// @nodoc
class __$$TaskFormSubmittedImplCopyWithImpl<$Res>
    extends _$TaskFormEventCopyWithImpl<$Res, _$TaskFormSubmittedImpl>
    implements _$$TaskFormSubmittedImplCopyWith<$Res> {
  __$$TaskFormSubmittedImplCopyWithImpl(
    _$TaskFormSubmittedImpl _value,
    $Res Function(_$TaskFormSubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialTask = freezed,
    Object? titulo = null,
    Object? descricao = freezed,
    Object? status = null,
    Object? prioridade = null,
    Object? atribuidoPara = freezed,
    Object? dataLimite = freezed,
  }) {
    return _then(
      _$TaskFormSubmittedImpl(
        initialTask: freezed == initialTask
            ? _value.initialTask
            : initialTask // ignore: cast_nullable_to_non_nullable
                  as Task?,
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
                  as TaskStatus,
        prioridade: null == prioridade
            ? _value.prioridade
            : prioridade // ignore: cast_nullable_to_non_nullable
                  as TaskPriority,
        atribuidoPara: freezed == atribuidoPara
            ? _value.atribuidoPara
            : atribuidoPara // ignore: cast_nullable_to_non_nullable
                  as int?,
        dataLimite: freezed == dataLimite
            ? _value.dataLimite
            : dataLimite // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$TaskFormSubmittedImpl implements TaskFormSubmitted {
  const _$TaskFormSubmittedImpl({
    this.initialTask,
    required this.titulo,
    this.descricao,
    required this.status,
    required this.prioridade,
    this.atribuidoPara,
    this.dataLimite,
  });

  @override
  final Task? initialTask;
  @override
  final String titulo;
  @override
  final String? descricao;
  @override
  final TaskStatus status;
  @override
  final TaskPriority prioridade;
  @override
  final int? atribuidoPara;
  @override
  final DateTime? dataLimite;

  @override
  String toString() {
    return 'TaskFormEvent.submitted(initialTask: $initialTask, titulo: $titulo, descricao: $descricao, status: $status, prioridade: $prioridade, atribuidoPara: $atribuidoPara, dataLimite: $dataLimite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFormSubmittedImpl &&
            (identical(other.initialTask, initialTask) ||
                other.initialTask == initialTask) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.atribuidoPara, atribuidoPara) ||
                other.atribuidoPara == atribuidoPara) &&
            (identical(other.dataLimite, dataLimite) ||
                other.dataLimite == dataLimite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    initialTask,
    titulo,
    descricao,
    status,
    prioridade,
    atribuidoPara,
    dataLimite,
  );

  /// Create a copy of TaskFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFormSubmittedImplCopyWith<_$TaskFormSubmittedImpl> get copyWith =>
      __$$TaskFormSubmittedImplCopyWithImpl<_$TaskFormSubmittedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      Task? initialTask,
      String titulo,
      String? descricao,
      TaskStatus status,
      TaskPriority prioridade,
      int? atribuidoPara,
      DateTime? dataLimite,
    )
    submitted,
  }) {
    return submitted(
      initialTask,
      titulo,
      descricao,
      status,
      prioridade,
      atribuidoPara,
      dataLimite,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      Task? initialTask,
      String titulo,
      String? descricao,
      TaskStatus status,
      TaskPriority prioridade,
      int? atribuidoPara,
      DateTime? dataLimite,
    )?
    submitted,
  }) {
    return submitted?.call(
      initialTask,
      titulo,
      descricao,
      status,
      prioridade,
      atribuidoPara,
      dataLimite,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      Task? initialTask,
      String titulo,
      String? descricao,
      TaskStatus status,
      TaskPriority prioridade,
      int? atribuidoPara,
      DateTime? dataLimite,
    )?
    submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(
        initialTask,
        titulo,
        descricao,
        status,
        prioridade,
        atribuidoPara,
        dataLimite,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskFormSubmitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormSubmitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class TaskFormSubmitted implements TaskFormEvent {
  const factory TaskFormSubmitted({
    final Task? initialTask,
    required final String titulo,
    final String? descricao,
    required final TaskStatus status,
    required final TaskPriority prioridade,
    final int? atribuidoPara,
    final DateTime? dataLimite,
  }) = _$TaskFormSubmittedImpl;

  @override
  Task? get initialTask;
  @override
  String get titulo;
  @override
  String? get descricao;
  @override
  TaskStatus get status;
  @override
  TaskPriority get prioridade;
  @override
  int? get atribuidoPara;
  @override
  DateTime? get dataLimite;

  /// Create a copy of TaskFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskFormSubmittedImplCopyWith<_$TaskFormSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
