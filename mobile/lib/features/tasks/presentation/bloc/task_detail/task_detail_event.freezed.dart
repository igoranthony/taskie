// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) loaded,
    required TResult Function() refreshed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? loaded,
    TResult? Function()? refreshed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? loaded,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskDetailLoaded value) loaded,
    required TResult Function(TaskDetailRefreshed value) refreshed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailLoaded value)? loaded,
    TResult? Function(TaskDetailRefreshed value)? refreshed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailLoaded value)? loaded,
    TResult Function(TaskDetailRefreshed value)? refreshed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailEventCopyWith(
    TaskDetailEvent value,
    $Res Function(TaskDetailEvent) then,
  ) = _$TaskDetailEventCopyWithImpl<$Res, TaskDetailEvent>;
}

/// @nodoc
class _$TaskDetailEventCopyWithImpl<$Res, $Val extends TaskDetailEvent>
    implements $TaskDetailEventCopyWith<$Res> {
  _$TaskDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDetailEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskDetailLoadedImplCopyWith<$Res> {
  factory _$$TaskDetailLoadedImplCopyWith(
    _$TaskDetailLoadedImpl value,
    $Res Function(_$TaskDetailLoadedImpl) then,
  ) = __$$TaskDetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$TaskDetailLoadedImplCopyWithImpl<$Res>
    extends _$TaskDetailEventCopyWithImpl<$Res, _$TaskDetailLoadedImpl>
    implements _$$TaskDetailLoadedImplCopyWith<$Res> {
  __$$TaskDetailLoadedImplCopyWithImpl(
    _$TaskDetailLoadedImpl _value,
    $Res Function(_$TaskDetailLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _$TaskDetailLoadedImpl(
        null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskDetailLoadedImpl implements TaskDetailLoaded {
  const _$TaskDetailLoadedImpl(this.taskId);

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskDetailEvent.loaded(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDetailLoadedImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDetailLoadedImplCopyWith<_$TaskDetailLoadedImpl> get copyWith =>
      __$$TaskDetailLoadedImplCopyWithImpl<_$TaskDetailLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) loaded,
    required TResult Function() refreshed,
  }) {
    return loaded(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? loaded,
    TResult? Function()? refreshed,
  }) {
    return loaded?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? loaded,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskDetailLoaded value) loaded,
    required TResult Function(TaskDetailRefreshed value) refreshed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailLoaded value)? loaded,
    TResult? Function(TaskDetailRefreshed value)? refreshed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailLoaded value)? loaded,
    TResult Function(TaskDetailRefreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskDetailLoaded implements TaskDetailEvent {
  const factory TaskDetailLoaded(final String taskId) = _$TaskDetailLoadedImpl;

  String get taskId;

  /// Create a copy of TaskDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDetailLoadedImplCopyWith<_$TaskDetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskDetailRefreshedImplCopyWith<$Res> {
  factory _$$TaskDetailRefreshedImplCopyWith(
    _$TaskDetailRefreshedImpl value,
    $Res Function(_$TaskDetailRefreshedImpl) then,
  ) = __$$TaskDetailRefreshedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskDetailRefreshedImplCopyWithImpl<$Res>
    extends _$TaskDetailEventCopyWithImpl<$Res, _$TaskDetailRefreshedImpl>
    implements _$$TaskDetailRefreshedImplCopyWith<$Res> {
  __$$TaskDetailRefreshedImplCopyWithImpl(
    _$TaskDetailRefreshedImpl _value,
    $Res Function(_$TaskDetailRefreshedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskDetailEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskDetailRefreshedImpl implements TaskDetailRefreshed {
  const _$TaskDetailRefreshedImpl();

  @override
  String toString() {
    return 'TaskDetailEvent.refreshed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDetailRefreshedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) loaded,
    required TResult Function() refreshed,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? loaded,
    TResult? Function()? refreshed,
  }) {
    return refreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? loaded,
    TResult Function()? refreshed,
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
    required TResult Function(TaskDetailLoaded value) loaded,
    required TResult Function(TaskDetailRefreshed value) refreshed,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailLoaded value)? loaded,
    TResult? Function(TaskDetailRefreshed value)? refreshed,
  }) {
    return refreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailLoaded value)? loaded,
    TResult Function(TaskDetailRefreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class TaskDetailRefreshed implements TaskDetailEvent {
  const factory TaskDetailRefreshed() = _$TaskDetailRefreshedImpl;
}
