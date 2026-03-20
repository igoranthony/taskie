// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskHistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskHistory> history) success,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskHistory> history)? success,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskHistory> history)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskHistoryInitial value) initial,
    required TResult Function(TaskHistoryLoading value) loading,
    required TResult Function(TaskHistorySuccess value) success,
    required TResult Function(TaskHistoryFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryInitial value)? initial,
    TResult? Function(TaskHistoryLoading value)? loading,
    TResult? Function(TaskHistorySuccess value)? success,
    TResult? Function(TaskHistoryFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryInitial value)? initial,
    TResult Function(TaskHistoryLoading value)? loading,
    TResult Function(TaskHistorySuccess value)? success,
    TResult Function(TaskHistoryFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskHistoryStateCopyWith<$Res> {
  factory $TaskHistoryStateCopyWith(
    TaskHistoryState value,
    $Res Function(TaskHistoryState) then,
  ) = _$TaskHistoryStateCopyWithImpl<$Res, TaskHistoryState>;
}

/// @nodoc
class _$TaskHistoryStateCopyWithImpl<$Res, $Val extends TaskHistoryState>
    implements $TaskHistoryStateCopyWith<$Res> {
  _$TaskHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskHistoryInitialImplCopyWith<$Res> {
  factory _$$TaskHistoryInitialImplCopyWith(
    _$TaskHistoryInitialImpl value,
    $Res Function(_$TaskHistoryInitialImpl) then,
  ) = __$$TaskHistoryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskHistoryInitialImplCopyWithImpl<$Res>
    extends _$TaskHistoryStateCopyWithImpl<$Res, _$TaskHistoryInitialImpl>
    implements _$$TaskHistoryInitialImplCopyWith<$Res> {
  __$$TaskHistoryInitialImplCopyWithImpl(
    _$TaskHistoryInitialImpl _value,
    $Res Function(_$TaskHistoryInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskHistoryInitialImpl implements TaskHistoryInitial {
  const _$TaskHistoryInitialImpl();

  @override
  String toString() {
    return 'TaskHistoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskHistoryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskHistory> history) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskHistory> history)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskHistory> history)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskHistoryInitial value) initial,
    required TResult Function(TaskHistoryLoading value) loading,
    required TResult Function(TaskHistorySuccess value) success,
    required TResult Function(TaskHistoryFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryInitial value)? initial,
    TResult? Function(TaskHistoryLoading value)? loading,
    TResult? Function(TaskHistorySuccess value)? success,
    TResult? Function(TaskHistoryFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryInitial value)? initial,
    TResult Function(TaskHistoryLoading value)? loading,
    TResult Function(TaskHistorySuccess value)? success,
    TResult Function(TaskHistoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskHistoryInitial implements TaskHistoryState {
  const factory TaskHistoryInitial() = _$TaskHistoryInitialImpl;
}

/// @nodoc
abstract class _$$TaskHistoryLoadingImplCopyWith<$Res> {
  factory _$$TaskHistoryLoadingImplCopyWith(
    _$TaskHistoryLoadingImpl value,
    $Res Function(_$TaskHistoryLoadingImpl) then,
  ) = __$$TaskHistoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskHistoryLoadingImplCopyWithImpl<$Res>
    extends _$TaskHistoryStateCopyWithImpl<$Res, _$TaskHistoryLoadingImpl>
    implements _$$TaskHistoryLoadingImplCopyWith<$Res> {
  __$$TaskHistoryLoadingImplCopyWithImpl(
    _$TaskHistoryLoadingImpl _value,
    $Res Function(_$TaskHistoryLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskHistoryLoadingImpl implements TaskHistoryLoading {
  const _$TaskHistoryLoadingImpl();

  @override
  String toString() {
    return 'TaskHistoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskHistoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskHistory> history) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskHistory> history)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskHistory> history)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskHistoryInitial value) initial,
    required TResult Function(TaskHistoryLoading value) loading,
    required TResult Function(TaskHistorySuccess value) success,
    required TResult Function(TaskHistoryFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryInitial value)? initial,
    TResult? Function(TaskHistoryLoading value)? loading,
    TResult? Function(TaskHistorySuccess value)? success,
    TResult? Function(TaskHistoryFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryInitial value)? initial,
    TResult Function(TaskHistoryLoading value)? loading,
    TResult Function(TaskHistorySuccess value)? success,
    TResult Function(TaskHistoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskHistoryLoading implements TaskHistoryState {
  const factory TaskHistoryLoading() = _$TaskHistoryLoadingImpl;
}

/// @nodoc
abstract class _$$TaskHistorySuccessImplCopyWith<$Res> {
  factory _$$TaskHistorySuccessImplCopyWith(
    _$TaskHistorySuccessImpl value,
    $Res Function(_$TaskHistorySuccessImpl) then,
  ) = __$$TaskHistorySuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskHistory> history});
}

/// @nodoc
class __$$TaskHistorySuccessImplCopyWithImpl<$Res>
    extends _$TaskHistoryStateCopyWithImpl<$Res, _$TaskHistorySuccessImpl>
    implements _$$TaskHistorySuccessImplCopyWith<$Res> {
  __$$TaskHistorySuccessImplCopyWithImpl(
    _$TaskHistorySuccessImpl _value,
    $Res Function(_$TaskHistorySuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? history = null}) {
    return _then(
      _$TaskHistorySuccessImpl(
        null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as List<TaskHistory>,
      ),
    );
  }
}

/// @nodoc

class _$TaskHistorySuccessImpl implements TaskHistorySuccess {
  const _$TaskHistorySuccessImpl(final List<TaskHistory> history)
    : _history = history;

  final List<TaskHistory> _history;
  @override
  List<TaskHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  String toString() {
    return 'TaskHistoryState.success(history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskHistorySuccessImpl &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_history));

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskHistorySuccessImplCopyWith<_$TaskHistorySuccessImpl> get copyWith =>
      __$$TaskHistorySuccessImplCopyWithImpl<_$TaskHistorySuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskHistory> history) success,
    required TResult Function(String message) failure,
  }) {
    return success(history);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskHistory> history)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(history);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskHistory> history)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(history);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskHistoryInitial value) initial,
    required TResult Function(TaskHistoryLoading value) loading,
    required TResult Function(TaskHistorySuccess value) success,
    required TResult Function(TaskHistoryFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryInitial value)? initial,
    TResult? Function(TaskHistoryLoading value)? loading,
    TResult? Function(TaskHistorySuccess value)? success,
    TResult? Function(TaskHistoryFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryInitial value)? initial,
    TResult Function(TaskHistoryLoading value)? loading,
    TResult Function(TaskHistorySuccess value)? success,
    TResult Function(TaskHistoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TaskHistorySuccess implements TaskHistoryState {
  const factory TaskHistorySuccess(final List<TaskHistory> history) =
      _$TaskHistorySuccessImpl;

  List<TaskHistory> get history;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskHistorySuccessImplCopyWith<_$TaskHistorySuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskHistoryFailureImplCopyWith<$Res> {
  factory _$$TaskHistoryFailureImplCopyWith(
    _$TaskHistoryFailureImpl value,
    $Res Function(_$TaskHistoryFailureImpl) then,
  ) = __$$TaskHistoryFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TaskHistoryFailureImplCopyWithImpl<$Res>
    extends _$TaskHistoryStateCopyWithImpl<$Res, _$TaskHistoryFailureImpl>
    implements _$$TaskHistoryFailureImplCopyWith<$Res> {
  __$$TaskHistoryFailureImplCopyWithImpl(
    _$TaskHistoryFailureImpl _value,
    $Res Function(_$TaskHistoryFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TaskHistoryFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskHistoryFailureImpl implements TaskHistoryFailure {
  const _$TaskHistoryFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TaskHistoryState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskHistoryFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskHistoryFailureImplCopyWith<_$TaskHistoryFailureImpl> get copyWith =>
      __$$TaskHistoryFailureImplCopyWithImpl<_$TaskHistoryFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskHistory> history) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskHistory> history)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskHistory> history)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskHistoryInitial value) initial,
    required TResult Function(TaskHistoryLoading value) loading,
    required TResult Function(TaskHistorySuccess value) success,
    required TResult Function(TaskHistoryFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskHistoryInitial value)? initial,
    TResult? Function(TaskHistoryLoading value)? loading,
    TResult? Function(TaskHistorySuccess value)? success,
    TResult? Function(TaskHistoryFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskHistoryInitial value)? initial,
    TResult Function(TaskHistoryLoading value)? loading,
    TResult Function(TaskHistorySuccess value)? success,
    TResult Function(TaskHistoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class TaskHistoryFailure implements TaskHistoryState {
  const factory TaskHistoryFailure(final String message) =
      _$TaskHistoryFailureImpl;

  String get message;

  /// Create a copy of TaskHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskHistoryFailureImplCopyWith<_$TaskHistoryFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
