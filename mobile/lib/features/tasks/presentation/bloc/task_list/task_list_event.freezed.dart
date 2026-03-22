// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListEventCopyWith<$Res> {
  factory $TaskListEventCopyWith(
    TaskListEvent value,
    $Res Function(TaskListEvent) then,
  ) = _$TaskListEventCopyWithImpl<$Res, TaskListEvent>;
}

/// @nodoc
class _$TaskListEventCopyWithImpl<$Res, $Val extends TaskListEvent>
    implements $TaskListEventCopyWith<$Res> {
  _$TaskListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskListLoadedImplCopyWith<$Res> {
  factory _$$TaskListLoadedImplCopyWith(
    _$TaskListLoadedImpl value,
    $Res Function(_$TaskListLoadedImpl) then,
  ) = __$$TaskListLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListLoadedImplCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res, _$TaskListLoadedImpl>
    implements _$$TaskListLoadedImplCopyWith<$Res> {
  __$$TaskListLoadedImplCopyWithImpl(
    _$TaskListLoadedImpl _value,
    $Res Function(_$TaskListLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskListLoadedImpl implements TaskListLoaded {
  const _$TaskListLoadedImpl();

  @override
  String toString() {
    return 'TaskListEvent.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskListLoaded implements TaskListEvent {
  const factory TaskListLoaded() = _$TaskListLoadedImpl;
}

/// @nodoc
abstract class _$$TaskListRefreshedImplCopyWith<$Res> {
  factory _$$TaskListRefreshedImplCopyWith(
    _$TaskListRefreshedImpl value,
    $Res Function(_$TaskListRefreshedImpl) then,
  ) = __$$TaskListRefreshedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListRefreshedImplCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res, _$TaskListRefreshedImpl>
    implements _$$TaskListRefreshedImplCopyWith<$Res> {
  __$$TaskListRefreshedImplCopyWithImpl(
    _$TaskListRefreshedImpl _value,
    $Res Function(_$TaskListRefreshedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskListRefreshedImpl implements TaskListRefreshed {
  const _$TaskListRefreshedImpl();

  @override
  String toString() {
    return 'TaskListEvent.refreshed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListRefreshedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) {
    return refreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) {
    return refreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class TaskListRefreshed implements TaskListEvent {
  const factory TaskListRefreshed() = _$TaskListRefreshedImpl;
}

/// @nodoc
abstract class _$$TaskListFilteredImplCopyWith<$Res> {
  factory _$$TaskListFilteredImplCopyWith(
    _$TaskListFilteredImpl value,
    $Res Function(_$TaskListFilteredImpl) then,
  ) = __$$TaskListFilteredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    TaskStatus? status,
    TaskPriority? prioridade,
    String? search,
    int? criadoPor,
    int? atribuidoPara,
    DateTime? criadoEmInicio,
    DateTime? criadoEmFim,
    DateTime? dataLimiteInicio,
    DateTime? dataLimiteFim,
  });
}

/// @nodoc
class __$$TaskListFilteredImplCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res, _$TaskListFilteredImpl>
    implements _$$TaskListFilteredImplCopyWith<$Res> {
  __$$TaskListFilteredImplCopyWithImpl(
    _$TaskListFilteredImpl _value,
    $Res Function(_$TaskListFilteredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? prioridade = freezed,
    Object? search = freezed,
    Object? criadoPor = freezed,
    Object? atribuidoPara = freezed,
    Object? criadoEmInicio = freezed,
    Object? criadoEmFim = freezed,
    Object? dataLimiteInicio = freezed,
    Object? dataLimiteFim = freezed,
  }) {
    return _then(
      _$TaskListFilteredImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus?,
        prioridade: freezed == prioridade
            ? _value.prioridade
            : prioridade // ignore: cast_nullable_to_non_nullable
                  as TaskPriority?,
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
        criadoPor: freezed == criadoPor
            ? _value.criadoPor
            : criadoPor // ignore: cast_nullable_to_non_nullable
                  as int?,
        atribuidoPara: freezed == atribuidoPara
            ? _value.atribuidoPara
            : atribuidoPara // ignore: cast_nullable_to_non_nullable
                  as int?,
        criadoEmInicio: freezed == criadoEmInicio
            ? _value.criadoEmInicio
            : criadoEmInicio // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        criadoEmFim: freezed == criadoEmFim
            ? _value.criadoEmFim
            : criadoEmFim // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dataLimiteInicio: freezed == dataLimiteInicio
            ? _value.dataLimiteInicio
            : dataLimiteInicio // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dataLimiteFim: freezed == dataLimiteFim
            ? _value.dataLimiteFim
            : dataLimiteFim // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$TaskListFilteredImpl implements TaskListFiltered {
  const _$TaskListFilteredImpl({
    this.status,
    this.prioridade,
    this.search,
    this.criadoPor,
    this.atribuidoPara,
    this.criadoEmInicio,
    this.criadoEmFim,
    this.dataLimiteInicio,
    this.dataLimiteFim,
  });

  @override
  final TaskStatus? status;
  @override
  final TaskPriority? prioridade;
  @override
  final String? search;
  @override
  final int? criadoPor;
  @override
  final int? atribuidoPara;
  @override
  final DateTime? criadoEmInicio;
  @override
  final DateTime? criadoEmFim;
  @override
  final DateTime? dataLimiteInicio;
  @override
  final DateTime? dataLimiteFim;

  @override
  String toString() {
    return 'TaskListEvent.filtered(status: $status, prioridade: $prioridade, search: $search, criadoPor: $criadoPor, atribuidoPara: $atribuidoPara, criadoEmInicio: $criadoEmInicio, criadoEmFim: $criadoEmFim, dataLimiteInicio: $dataLimiteInicio, dataLimiteFim: $dataLimiteFim)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListFilteredImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.criadoPor, criadoPor) ||
                other.criadoPor == criadoPor) &&
            (identical(other.atribuidoPara, atribuidoPara) ||
                other.atribuidoPara == atribuidoPara) &&
            (identical(other.criadoEmInicio, criadoEmInicio) ||
                other.criadoEmInicio == criadoEmInicio) &&
            (identical(other.criadoEmFim, criadoEmFim) ||
                other.criadoEmFim == criadoEmFim) &&
            (identical(other.dataLimiteInicio, dataLimiteInicio) ||
                other.dataLimiteInicio == dataLimiteInicio) &&
            (identical(other.dataLimiteFim, dataLimiteFim) ||
                other.dataLimiteFim == dataLimiteFim));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    prioridade,
    search,
    criadoPor,
    atribuidoPara,
    criadoEmInicio,
    criadoEmFim,
    dataLimiteInicio,
    dataLimiteFim,
  );

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListFilteredImplCopyWith<_$TaskListFilteredImpl> get copyWith =>
      __$$TaskListFilteredImplCopyWithImpl<_$TaskListFilteredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) {
    return filtered(
      status,
      prioridade,
      search,
      criadoPor,
      atribuidoPara,
      criadoEmInicio,
      criadoEmFim,
      dataLimiteInicio,
      dataLimiteFim,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) {
    return filtered?.call(
      status,
      prioridade,
      search,
      criadoPor,
      atribuidoPara,
      criadoEmInicio,
      criadoEmFim,
      dataLimiteInicio,
      dataLimiteFim,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(
        status,
        prioridade,
        search,
        criadoPor,
        atribuidoPara,
        criadoEmInicio,
        criadoEmFim,
        dataLimiteInicio,
        dataLimiteFim,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) {
    return filtered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) {
    return filtered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(this);
    }
    return orElse();
  }
}

abstract class TaskListFiltered implements TaskListEvent {
  const factory TaskListFiltered({
    final TaskStatus? status,
    final TaskPriority? prioridade,
    final String? search,
    final int? criadoPor,
    final int? atribuidoPara,
    final DateTime? criadoEmInicio,
    final DateTime? criadoEmFim,
    final DateTime? dataLimiteInicio,
    final DateTime? dataLimiteFim,
  }) = _$TaskListFilteredImpl;

  TaskStatus? get status;
  TaskPriority? get prioridade;
  String? get search;
  int? get criadoPor;
  int? get atribuidoPara;
  DateTime? get criadoEmInicio;
  DateTime? get criadoEmFim;
  DateTime? get dataLimiteInicio;
  DateTime? get dataLimiteFim;

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListFilteredImplCopyWith<_$TaskListFilteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListLoadedMoreImplCopyWith<$Res> {
  factory _$$TaskListLoadedMoreImplCopyWith(
    _$TaskListLoadedMoreImpl value,
    $Res Function(_$TaskListLoadedMoreImpl) then,
  ) = __$$TaskListLoadedMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskListLoadedMoreImplCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res, _$TaskListLoadedMoreImpl>
    implements _$$TaskListLoadedMoreImplCopyWith<$Res> {
  __$$TaskListLoadedMoreImplCopyWithImpl(
    _$TaskListLoadedMoreImpl _value,
    $Res Function(_$TaskListLoadedMoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskListLoadedMoreImpl implements TaskListLoadedMore {
  const _$TaskListLoadedMoreImpl();

  @override
  String toString() {
    return 'TaskListEvent.loadedMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskListLoadedMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) {
    return loadedMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) {
    return loadedMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) {
    if (loadedMore != null) {
      return loadedMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) {
    return loadedMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) {
    return loadedMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) {
    if (loadedMore != null) {
      return loadedMore(this);
    }
    return orElse();
  }
}

abstract class TaskListLoadedMore implements TaskListEvent {
  const factory TaskListLoadedMore() = _$TaskListLoadedMoreImpl;
}

/// @nodoc
abstract class _$$TaskListTaskDeletedImplCopyWith<$Res> {
  factory _$$TaskListTaskDeletedImplCopyWith(
    _$TaskListTaskDeletedImpl value,
    $Res Function(_$TaskListTaskDeletedImpl) then,
  ) = __$$TaskListTaskDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$TaskListTaskDeletedImplCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res, _$TaskListTaskDeletedImpl>
    implements _$$TaskListTaskDeletedImplCopyWith<$Res> {
  __$$TaskListTaskDeletedImplCopyWithImpl(
    _$TaskListTaskDeletedImpl _value,
    $Res Function(_$TaskListTaskDeletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$TaskListTaskDeletedImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskListTaskDeletedImpl implements TaskListTaskDeleted {
  const _$TaskListTaskDeletedImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TaskListEvent.taskDeleted(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListTaskDeletedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListTaskDeletedImplCopyWith<_$TaskListTaskDeletedImpl> get copyWith =>
      __$$TaskListTaskDeletedImplCopyWithImpl<_$TaskListTaskDeletedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) {
    return taskDeleted(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) {
    return taskDeleted?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) {
    if (taskDeleted != null) {
      return taskDeleted(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) {
    return taskDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) {
    return taskDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) {
    if (taskDeleted != null) {
      return taskDeleted(this);
    }
    return orElse();
  }
}

abstract class TaskListTaskDeleted implements TaskListEvent {
  const factory TaskListTaskDeleted(final String id) =
      _$TaskListTaskDeletedImpl;

  String get id;

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListTaskDeletedImplCopyWith<_$TaskListTaskDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskListTaskUpdatedImplCopyWith<$Res> {
  factory _$$TaskListTaskUpdatedImplCopyWith(
    _$TaskListTaskUpdatedImpl value,
    $Res Function(_$TaskListTaskUpdatedImpl) then,
  ) = __$$TaskListTaskUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});
}

/// @nodoc
class __$$TaskListTaskUpdatedImplCopyWithImpl<$Res>
    extends _$TaskListEventCopyWithImpl<$Res, _$TaskListTaskUpdatedImpl>
    implements _$$TaskListTaskUpdatedImplCopyWith<$Res> {
  __$$TaskListTaskUpdatedImplCopyWithImpl(
    _$TaskListTaskUpdatedImpl _value,
    $Res Function(_$TaskListTaskUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? task = null}) {
    return _then(
      _$TaskListTaskUpdatedImpl(
        null == task
            ? _value.task
            : task // ignore: cast_nullable_to_non_nullable
                  as Task,
      ),
    );
  }
}

/// @nodoc

class _$TaskListTaskUpdatedImpl implements TaskListTaskUpdated {
  const _$TaskListTaskUpdatedImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskListEvent.taskUpdated(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListTaskUpdatedImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListTaskUpdatedImplCopyWith<_$TaskListTaskUpdatedImpl> get copyWith =>
      __$$TaskListTaskUpdatedImplCopyWithImpl<_$TaskListTaskUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() refreshed,
    required TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )
    filtered,
    required TResult Function() loadedMore,
    required TResult Function(String id) taskDeleted,
    required TResult Function(Task task) taskUpdated,
  }) {
    return taskUpdated(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult? Function()? loadedMore,
    TResult? Function(String id)? taskDeleted,
    TResult? Function(Task task)? taskUpdated,
  }) {
    return taskUpdated?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(
      TaskStatus? status,
      TaskPriority? prioridade,
      String? search,
      int? criadoPor,
      int? atribuidoPara,
      DateTime? criadoEmInicio,
      DateTime? criadoEmFim,
      DateTime? dataLimiteInicio,
      DateTime? dataLimiteFim,
    )?
    filtered,
    TResult Function()? loadedMore,
    TResult Function(String id)? taskDeleted,
    TResult Function(Task task)? taskUpdated,
    required TResult orElse(),
  }) {
    if (taskUpdated != null) {
      return taskUpdated(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListLoadedMore value) loadedMore,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
    required TResult Function(TaskListTaskUpdated value) taskUpdated,
  }) {
    return taskUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListLoadedMore value)? loadedMore,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
    TResult? Function(TaskListTaskUpdated value)? taskUpdated,
  }) {
    return taskUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListLoadedMore value)? loadedMore,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    TResult Function(TaskListTaskUpdated value)? taskUpdated,
    required TResult orElse(),
  }) {
    if (taskUpdated != null) {
      return taskUpdated(this);
    }
    return orElse();
  }
}

abstract class TaskListTaskUpdated implements TaskListEvent {
  const factory TaskListTaskUpdated(final Task task) =
      _$TaskListTaskUpdatedImpl;

  Task get task;

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListTaskUpdatedImplCopyWith<_$TaskListTaskUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
