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
    required TResult Function(TaskStatus? status) filtered,
    required TResult Function(String id) taskDeleted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(TaskStatus? status)? filtered,
    TResult? Function(String id)? taskDeleted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(TaskStatus? status)? filtered,
    TResult Function(String id)? taskDeleted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
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
    required TResult Function(TaskStatus? status) filtered,
    required TResult Function(String id) taskDeleted,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(TaskStatus? status)? filtered,
    TResult? Function(String id)? taskDeleted,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(TaskStatus? status)? filtered,
    TResult Function(String id)? taskDeleted,
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
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
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
    required TResult Function(TaskStatus? status) filtered,
    required TResult Function(String id) taskDeleted,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(TaskStatus? status)? filtered,
    TResult? Function(String id)? taskDeleted,
  }) {
    return refreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(TaskStatus? status)? filtered,
    TResult Function(String id)? taskDeleted,
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
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
  }) {
    return refreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
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
  $Res call({TaskStatus? status});
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
  $Res call({Object? status = freezed}) {
    return _then(
      _$TaskListFilteredImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus?,
      ),
    );
  }
}

/// @nodoc

class _$TaskListFilteredImpl implements TaskListFiltered {
  const _$TaskListFilteredImpl({this.status});

  @override
  final TaskStatus? status;

  @override
  String toString() {
    return 'TaskListEvent.filtered(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListFilteredImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

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
    required TResult Function(TaskStatus? status) filtered,
    required TResult Function(String id) taskDeleted,
  }) {
    return filtered(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(TaskStatus? status)? filtered,
    TResult? Function(String id)? taskDeleted,
  }) {
    return filtered?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(TaskStatus? status)? filtered,
    TResult Function(String id)? taskDeleted,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskListLoaded value) loaded,
    required TResult Function(TaskListRefreshed value) refreshed,
    required TResult Function(TaskListFiltered value) filtered,
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
  }) {
    return filtered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
  }) {
    return filtered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(this);
    }
    return orElse();
  }
}

abstract class TaskListFiltered implements TaskListEvent {
  const factory TaskListFiltered({final TaskStatus? status}) =
      _$TaskListFilteredImpl;

  TaskStatus? get status;

  /// Create a copy of TaskListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskListFilteredImplCopyWith<_$TaskListFilteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(TaskStatus? status) filtered,
    required TResult Function(String id) taskDeleted,
  }) {
    return taskDeleted(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? refreshed,
    TResult? Function(TaskStatus? status)? filtered,
    TResult? Function(String id)? taskDeleted,
  }) {
    return taskDeleted?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? refreshed,
    TResult Function(TaskStatus? status)? filtered,
    TResult Function(String id)? taskDeleted,
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
    required TResult Function(TaskListTaskDeleted value) taskDeleted,
  }) {
    return taskDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskListLoaded value)? loaded,
    TResult? Function(TaskListRefreshed value)? refreshed,
    TResult? Function(TaskListFiltered value)? filtered,
    TResult? Function(TaskListTaskDeleted value)? taskDeleted,
  }) {
    return taskDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskListLoaded value)? loaded,
    TResult Function(TaskListRefreshed value)? refreshed,
    TResult Function(TaskListFiltered value)? filtered,
    TResult Function(TaskListTaskDeleted value)? taskDeleted,
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
