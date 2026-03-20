// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskHistoryEvent {
  String get taskId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskHistoryLoaded value) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryLoaded value)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryLoaded value)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of TaskHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskHistoryEventCopyWith<TaskHistoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskHistoryEventCopyWith<$Res> {
  factory $TaskHistoryEventCopyWith(
    TaskHistoryEvent value,
    $Res Function(TaskHistoryEvent) then,
  ) = _$TaskHistoryEventCopyWithImpl<$Res, TaskHistoryEvent>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class _$TaskHistoryEventCopyWithImpl<$Res, $Val extends TaskHistoryEvent>
    implements $TaskHistoryEventCopyWith<$Res> {
  _$TaskHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _value.copyWith(
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskHistoryLoadedImplCopyWith<$Res>
    implements $TaskHistoryEventCopyWith<$Res> {
  factory _$$TaskHistoryLoadedImplCopyWith(
    _$TaskHistoryLoadedImpl value,
    $Res Function(_$TaskHistoryLoadedImpl) then,
  ) = __$$TaskHistoryLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$TaskHistoryLoadedImplCopyWithImpl<$Res>
    extends _$TaskHistoryEventCopyWithImpl<$Res, _$TaskHistoryLoadedImpl>
    implements _$$TaskHistoryLoadedImplCopyWith<$Res> {
  __$$TaskHistoryLoadedImplCopyWithImpl(
    _$TaskHistoryLoadedImpl _value,
    $Res Function(_$TaskHistoryLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taskId = null}) {
    return _then(
      _$TaskHistoryLoadedImpl(
        null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskHistoryLoadedImpl implements TaskHistoryLoaded {
  const _$TaskHistoryLoadedImpl(this.taskId);

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskHistoryEvent.loaded(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskHistoryLoadedImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskHistoryLoadedImplCopyWith<_$TaskHistoryLoadedImpl> get copyWith =>
      __$$TaskHistoryLoadedImplCopyWithImpl<_$TaskHistoryLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId) loaded,
  }) {
    return loaded(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId)? loaded,
  }) {
    return loaded?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId)? loaded,
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
    required TResult Function(TaskHistoryLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TaskHistoryLoaded implements TaskHistoryEvent {
  const factory TaskHistoryLoaded(final String taskId) =
      _$TaskHistoryLoadedImpl;

  @override
  String get taskId;

  /// Create a copy of TaskHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskHistoryLoadedImplCopyWith<_$TaskHistoryLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
