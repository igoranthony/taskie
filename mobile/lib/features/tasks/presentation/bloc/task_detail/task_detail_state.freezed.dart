// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Task task) success,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Task task)? success,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Task task)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskDetailInitial value) initial,
    required TResult Function(TaskDetailLoading value) loading,
    required TResult Function(TaskDetailSuccess value) success,
    required TResult Function(TaskDetailFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailInitial value)? initial,
    TResult? Function(TaskDetailLoading value)? loading,
    TResult? Function(TaskDetailSuccess value)? success,
    TResult? Function(TaskDetailFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailInitial value)? initial,
    TResult Function(TaskDetailLoading value)? loading,
    TResult Function(TaskDetailSuccess value)? success,
    TResult Function(TaskDetailFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailStateCopyWith(
    TaskDetailState value,
    $Res Function(TaskDetailState) then,
  ) = _$TaskDetailStateCopyWithImpl<$Res, TaskDetailState>;
}

/// @nodoc
class _$TaskDetailStateCopyWithImpl<$Res, $Val extends TaskDetailState>
    implements $TaskDetailStateCopyWith<$Res> {
  _$TaskDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskDetailInitialImplCopyWith<$Res> {
  factory _$$TaskDetailInitialImplCopyWith(
    _$TaskDetailInitialImpl value,
    $Res Function(_$TaskDetailInitialImpl) then,
  ) = __$$TaskDetailInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskDetailInitialImplCopyWithImpl<$Res>
    extends _$TaskDetailStateCopyWithImpl<$Res, _$TaskDetailInitialImpl>
    implements _$$TaskDetailInitialImplCopyWith<$Res> {
  __$$TaskDetailInitialImplCopyWithImpl(
    _$TaskDetailInitialImpl _value,
    $Res Function(_$TaskDetailInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskDetailInitialImpl implements TaskDetailInitial {
  const _$TaskDetailInitialImpl();

  @override
  String toString() {
    return 'TaskDetailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskDetailInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Task task) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Task task)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Task task)? success,
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
    required TResult Function(TaskDetailInitial value) initial,
    required TResult Function(TaskDetailLoading value) loading,
    required TResult Function(TaskDetailSuccess value) success,
    required TResult Function(TaskDetailFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailInitial value)? initial,
    TResult? Function(TaskDetailLoading value)? loading,
    TResult? Function(TaskDetailSuccess value)? success,
    TResult? Function(TaskDetailFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailInitial value)? initial,
    TResult Function(TaskDetailLoading value)? loading,
    TResult Function(TaskDetailSuccess value)? success,
    TResult Function(TaskDetailFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskDetailInitial implements TaskDetailState {
  const factory TaskDetailInitial() = _$TaskDetailInitialImpl;
}

/// @nodoc
abstract class _$$TaskDetailLoadingImplCopyWith<$Res> {
  factory _$$TaskDetailLoadingImplCopyWith(
    _$TaskDetailLoadingImpl value,
    $Res Function(_$TaskDetailLoadingImpl) then,
  ) = __$$TaskDetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskDetailLoadingImplCopyWithImpl<$Res>
    extends _$TaskDetailStateCopyWithImpl<$Res, _$TaskDetailLoadingImpl>
    implements _$$TaskDetailLoadingImplCopyWith<$Res> {
  __$$TaskDetailLoadingImplCopyWithImpl(
    _$TaskDetailLoadingImpl _value,
    $Res Function(_$TaskDetailLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskDetailLoadingImpl implements TaskDetailLoading {
  const _$TaskDetailLoadingImpl();

  @override
  String toString() {
    return 'TaskDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskDetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Task task) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Task task)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Task task)? success,
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
    required TResult Function(TaskDetailInitial value) initial,
    required TResult Function(TaskDetailLoading value) loading,
    required TResult Function(TaskDetailSuccess value) success,
    required TResult Function(TaskDetailFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailInitial value)? initial,
    TResult? Function(TaskDetailLoading value)? loading,
    TResult? Function(TaskDetailSuccess value)? success,
    TResult? Function(TaskDetailFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailInitial value)? initial,
    TResult Function(TaskDetailLoading value)? loading,
    TResult Function(TaskDetailSuccess value)? success,
    TResult Function(TaskDetailFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskDetailLoading implements TaskDetailState {
  const factory TaskDetailLoading() = _$TaskDetailLoadingImpl;
}

/// @nodoc
abstract class _$$TaskDetailSuccessImplCopyWith<$Res> {
  factory _$$TaskDetailSuccessImplCopyWith(
    _$TaskDetailSuccessImpl value,
    $Res Function(_$TaskDetailSuccessImpl) then,
  ) = __$$TaskDetailSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});
}

/// @nodoc
class __$$TaskDetailSuccessImplCopyWithImpl<$Res>
    extends _$TaskDetailStateCopyWithImpl<$Res, _$TaskDetailSuccessImpl>
    implements _$$TaskDetailSuccessImplCopyWith<$Res> {
  __$$TaskDetailSuccessImplCopyWithImpl(
    _$TaskDetailSuccessImpl _value,
    $Res Function(_$TaskDetailSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? task = null}) {
    return _then(
      _$TaskDetailSuccessImpl(
        null == task
            ? _value.task
            : task // ignore: cast_nullable_to_non_nullable
                  as Task,
      ),
    );
  }
}

/// @nodoc

class _$TaskDetailSuccessImpl implements TaskDetailSuccess {
  const _$TaskDetailSuccessImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskDetailState.success(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDetailSuccessImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDetailSuccessImplCopyWith<_$TaskDetailSuccessImpl> get copyWith =>
      __$$TaskDetailSuccessImplCopyWithImpl<_$TaskDetailSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Task task) success,
    required TResult Function(String message) failure,
  }) {
    return success(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Task task)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Task task)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskDetailInitial value) initial,
    required TResult Function(TaskDetailLoading value) loading,
    required TResult Function(TaskDetailSuccess value) success,
    required TResult Function(TaskDetailFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailInitial value)? initial,
    TResult? Function(TaskDetailLoading value)? loading,
    TResult? Function(TaskDetailSuccess value)? success,
    TResult? Function(TaskDetailFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailInitial value)? initial,
    TResult Function(TaskDetailLoading value)? loading,
    TResult Function(TaskDetailSuccess value)? success,
    TResult Function(TaskDetailFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TaskDetailSuccess implements TaskDetailState {
  const factory TaskDetailSuccess(final Task task) = _$TaskDetailSuccessImpl;

  Task get task;

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDetailSuccessImplCopyWith<_$TaskDetailSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskDetailFailureImplCopyWith<$Res> {
  factory _$$TaskDetailFailureImplCopyWith(
    _$TaskDetailFailureImpl value,
    $Res Function(_$TaskDetailFailureImpl) then,
  ) = __$$TaskDetailFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TaskDetailFailureImplCopyWithImpl<$Res>
    extends _$TaskDetailStateCopyWithImpl<$Res, _$TaskDetailFailureImpl>
    implements _$$TaskDetailFailureImplCopyWith<$Res> {
  __$$TaskDetailFailureImplCopyWithImpl(
    _$TaskDetailFailureImpl _value,
    $Res Function(_$TaskDetailFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TaskDetailFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskDetailFailureImpl implements TaskDetailFailure {
  const _$TaskDetailFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TaskDetailState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDetailFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDetailFailureImplCopyWith<_$TaskDetailFailureImpl> get copyWith =>
      __$$TaskDetailFailureImplCopyWithImpl<_$TaskDetailFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Task task) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Task task)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Task task)? success,
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
    required TResult Function(TaskDetailInitial value) initial,
    required TResult Function(TaskDetailLoading value) loading,
    required TResult Function(TaskDetailSuccess value) success,
    required TResult Function(TaskDetailFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskDetailInitial value)? initial,
    TResult? Function(TaskDetailLoading value)? loading,
    TResult? Function(TaskDetailSuccess value)? success,
    TResult? Function(TaskDetailFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskDetailInitial value)? initial,
    TResult Function(TaskDetailLoading value)? loading,
    TResult Function(TaskDetailSuccess value)? success,
    TResult Function(TaskDetailFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class TaskDetailFailure implements TaskDetailState {
  const factory TaskDetailFailure(final String message) =
      _$TaskDetailFailureImpl;

  String get message;

  /// Create a copy of TaskDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDetailFailureImplCopyWith<_$TaskDetailFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
