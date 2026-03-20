// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TaskFormState {
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
    required TResult Function(TaskFormInitial value) initial,
    required TResult Function(TaskFormLoading value) loading,
    required TResult Function(TaskFormSuccess value) success,
    required TResult Function(TaskFormFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormInitial value)? initial,
    TResult? Function(TaskFormLoading value)? loading,
    TResult? Function(TaskFormSuccess value)? success,
    TResult? Function(TaskFormFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormInitial value)? initial,
    TResult Function(TaskFormLoading value)? loading,
    TResult Function(TaskFormSuccess value)? success,
    TResult Function(TaskFormFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFormStateCopyWith<$Res> {
  factory $TaskFormStateCopyWith(
    TaskFormState value,
    $Res Function(TaskFormState) then,
  ) = _$TaskFormStateCopyWithImpl<$Res, TaskFormState>;
}

/// @nodoc
class _$TaskFormStateCopyWithImpl<$Res, $Val extends TaskFormState>
    implements $TaskFormStateCopyWith<$Res> {
  _$TaskFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskFormInitialImplCopyWith<$Res> {
  factory _$$TaskFormInitialImplCopyWith(
    _$TaskFormInitialImpl value,
    $Res Function(_$TaskFormInitialImpl) then,
  ) = __$$TaskFormInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskFormInitialImplCopyWithImpl<$Res>
    extends _$TaskFormStateCopyWithImpl<$Res, _$TaskFormInitialImpl>
    implements _$$TaskFormInitialImplCopyWith<$Res> {
  __$$TaskFormInitialImplCopyWithImpl(
    _$TaskFormInitialImpl _value,
    $Res Function(_$TaskFormInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskFormInitialImpl implements TaskFormInitial {
  const _$TaskFormInitialImpl();

  @override
  String toString() {
    return 'TaskFormState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskFormInitialImpl);
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
    required TResult Function(TaskFormInitial value) initial,
    required TResult Function(TaskFormLoading value) loading,
    required TResult Function(TaskFormSuccess value) success,
    required TResult Function(TaskFormFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormInitial value)? initial,
    TResult? Function(TaskFormLoading value)? loading,
    TResult? Function(TaskFormSuccess value)? success,
    TResult? Function(TaskFormFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormInitial value)? initial,
    TResult Function(TaskFormLoading value)? loading,
    TResult Function(TaskFormSuccess value)? success,
    TResult Function(TaskFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TaskFormInitial implements TaskFormState {
  const factory TaskFormInitial() = _$TaskFormInitialImpl;
}

/// @nodoc
abstract class _$$TaskFormLoadingImplCopyWith<$Res> {
  factory _$$TaskFormLoadingImplCopyWith(
    _$TaskFormLoadingImpl value,
    $Res Function(_$TaskFormLoadingImpl) then,
  ) = __$$TaskFormLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskFormLoadingImplCopyWithImpl<$Res>
    extends _$TaskFormStateCopyWithImpl<$Res, _$TaskFormLoadingImpl>
    implements _$$TaskFormLoadingImplCopyWith<$Res> {
  __$$TaskFormLoadingImplCopyWithImpl(
    _$TaskFormLoadingImpl _value,
    $Res Function(_$TaskFormLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskFormLoadingImpl implements TaskFormLoading {
  const _$TaskFormLoadingImpl();

  @override
  String toString() {
    return 'TaskFormState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskFormLoadingImpl);
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
    required TResult Function(TaskFormInitial value) initial,
    required TResult Function(TaskFormLoading value) loading,
    required TResult Function(TaskFormSuccess value) success,
    required TResult Function(TaskFormFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormInitial value)? initial,
    TResult? Function(TaskFormLoading value)? loading,
    TResult? Function(TaskFormSuccess value)? success,
    TResult? Function(TaskFormFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormInitial value)? initial,
    TResult Function(TaskFormLoading value)? loading,
    TResult Function(TaskFormSuccess value)? success,
    TResult Function(TaskFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TaskFormLoading implements TaskFormState {
  const factory TaskFormLoading() = _$TaskFormLoadingImpl;
}

/// @nodoc
abstract class _$$TaskFormSuccessImplCopyWith<$Res> {
  factory _$$TaskFormSuccessImplCopyWith(
    _$TaskFormSuccessImpl value,
    $Res Function(_$TaskFormSuccessImpl) then,
  ) = __$$TaskFormSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});
}

/// @nodoc
class __$$TaskFormSuccessImplCopyWithImpl<$Res>
    extends _$TaskFormStateCopyWithImpl<$Res, _$TaskFormSuccessImpl>
    implements _$$TaskFormSuccessImplCopyWith<$Res> {
  __$$TaskFormSuccessImplCopyWithImpl(
    _$TaskFormSuccessImpl _value,
    $Res Function(_$TaskFormSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? task = null}) {
    return _then(
      _$TaskFormSuccessImpl(
        null == task
            ? _value.task
            : task // ignore: cast_nullable_to_non_nullable
                  as Task,
      ),
    );
  }
}

/// @nodoc

class _$TaskFormSuccessImpl implements TaskFormSuccess {
  const _$TaskFormSuccessImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskFormState.success(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFormSuccessImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFormSuccessImplCopyWith<_$TaskFormSuccessImpl> get copyWith =>
      __$$TaskFormSuccessImplCopyWithImpl<_$TaskFormSuccessImpl>(
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
    required TResult Function(TaskFormInitial value) initial,
    required TResult Function(TaskFormLoading value) loading,
    required TResult Function(TaskFormSuccess value) success,
    required TResult Function(TaskFormFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormInitial value)? initial,
    TResult? Function(TaskFormLoading value)? loading,
    TResult? Function(TaskFormSuccess value)? success,
    TResult? Function(TaskFormFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormInitial value)? initial,
    TResult Function(TaskFormLoading value)? loading,
    TResult Function(TaskFormSuccess value)? success,
    TResult Function(TaskFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TaskFormSuccess implements TaskFormState {
  const factory TaskFormSuccess(final Task task) = _$TaskFormSuccessImpl;

  Task get task;

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskFormSuccessImplCopyWith<_$TaskFormSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskFormFailureImplCopyWith<$Res> {
  factory _$$TaskFormFailureImplCopyWith(
    _$TaskFormFailureImpl value,
    $Res Function(_$TaskFormFailureImpl) then,
  ) = __$$TaskFormFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TaskFormFailureImplCopyWithImpl<$Res>
    extends _$TaskFormStateCopyWithImpl<$Res, _$TaskFormFailureImpl>
    implements _$$TaskFormFailureImplCopyWith<$Res> {
  __$$TaskFormFailureImplCopyWithImpl(
    _$TaskFormFailureImpl _value,
    $Res Function(_$TaskFormFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TaskFormFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TaskFormFailureImpl implements TaskFormFailure {
  const _$TaskFormFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TaskFormState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFormFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFormFailureImplCopyWith<_$TaskFormFailureImpl> get copyWith =>
      __$$TaskFormFailureImplCopyWithImpl<_$TaskFormFailureImpl>(
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
    required TResult Function(TaskFormInitial value) initial,
    required TResult Function(TaskFormLoading value) loading,
    required TResult Function(TaskFormSuccess value) success,
    required TResult Function(TaskFormFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskFormInitial value)? initial,
    TResult? Function(TaskFormLoading value)? loading,
    TResult? Function(TaskFormSuccess value)? success,
    TResult? Function(TaskFormFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskFormInitial value)? initial,
    TResult Function(TaskFormLoading value)? loading,
    TResult Function(TaskFormSuccess value)? success,
    TResult Function(TaskFormFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class TaskFormFailure implements TaskFormState {
  const factory TaskFormFailure(final String message) = _$TaskFormFailureImpl;

  String get message;

  /// Create a copy of TaskFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskFormFailureImplCopyWith<_$TaskFormFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
