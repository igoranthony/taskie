// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UsersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserSummary> users) loaded,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserSummary> users)? loaded,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserSummary> users)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersLoaded value) loaded,
    required TResult Function(UsersFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersLoaded value)? loaded,
    TResult? Function(UsersFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersLoaded value)? loaded,
    TResult Function(UsersFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
    UsersState value,
    $Res Function(UsersState) then,
  ) = _$UsersStateCopyWithImpl<$Res, UsersState>;
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UsersInitialImplCopyWith<$Res> {
  factory _$$UsersInitialImplCopyWith(
    _$UsersInitialImpl value,
    $Res Function(_$UsersInitialImpl) then,
  ) = __$$UsersInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersInitialImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersInitialImpl>
    implements _$$UsersInitialImplCopyWith<$Res> {
  __$$UsersInitialImplCopyWithImpl(
    _$UsersInitialImpl _value,
    $Res Function(_$UsersInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UsersInitialImpl implements UsersInitial {
  const _$UsersInitialImpl();

  @override
  String toString() {
    return 'UsersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserSummary> users) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserSummary> users)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserSummary> users)? loaded,
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
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersLoaded value) loaded,
    required TResult Function(UsersFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersLoaded value)? loaded,
    TResult? Function(UsersFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersLoaded value)? loaded,
    TResult Function(UsersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UsersInitial implements UsersState {
  const factory UsersInitial() = _$UsersInitialImpl;
}

/// @nodoc
abstract class _$$UsersLoadingImplCopyWith<$Res> {
  factory _$$UsersLoadingImplCopyWith(
    _$UsersLoadingImpl value,
    $Res Function(_$UsersLoadingImpl) then,
  ) = __$$UsersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersLoadingImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersLoadingImpl>
    implements _$$UsersLoadingImplCopyWith<$Res> {
  __$$UsersLoadingImplCopyWithImpl(
    _$UsersLoadingImpl _value,
    $Res Function(_$UsersLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UsersLoadingImpl implements UsersLoading {
  const _$UsersLoadingImpl();

  @override
  String toString() {
    return 'UsersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserSummary> users) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserSummary> users)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserSummary> users)? loaded,
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
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersLoaded value) loaded,
    required TResult Function(UsersFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersLoaded value)? loaded,
    TResult? Function(UsersFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersLoaded value)? loaded,
    TResult Function(UsersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UsersLoading implements UsersState {
  const factory UsersLoading() = _$UsersLoadingImpl;
}

/// @nodoc
abstract class _$$UsersLoadedImplCopyWith<$Res> {
  factory _$$UsersLoadedImplCopyWith(
    _$UsersLoadedImpl value,
    $Res Function(_$UsersLoadedImpl) then,
  ) = __$$UsersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserSummary> users});
}

/// @nodoc
class __$$UsersLoadedImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersLoadedImpl>
    implements _$$UsersLoadedImplCopyWith<$Res> {
  __$$UsersLoadedImplCopyWithImpl(
    _$UsersLoadedImpl _value,
    $Res Function(_$UsersLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null}) {
    return _then(
      _$UsersLoadedImpl(
        null == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<UserSummary>,
      ),
    );
  }
}

/// @nodoc

class _$UsersLoadedImpl implements UsersLoaded {
  const _$UsersLoadedImpl(final List<UserSummary> users) : _users = users;

  final List<UserSummary> _users;
  @override
  List<UserSummary> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UsersState.loaded(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersLoadedImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersLoadedImplCopyWith<_$UsersLoadedImpl> get copyWith =>
      __$$UsersLoadedImplCopyWithImpl<_$UsersLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserSummary> users) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserSummary> users)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserSummary> users)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersLoaded value) loaded,
    required TResult Function(UsersFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersLoaded value)? loaded,
    TResult? Function(UsersFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersLoaded value)? loaded,
    TResult Function(UsersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UsersLoaded implements UsersState {
  const factory UsersLoaded(final List<UserSummary> users) = _$UsersLoadedImpl;

  List<UserSummary> get users;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersLoadedImplCopyWith<_$UsersLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersFailureImplCopyWith<$Res> {
  factory _$$UsersFailureImplCopyWith(
    _$UsersFailureImpl value,
    $Res Function(_$UsersFailureImpl) then,
  ) = __$$UsersFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UsersFailureImplCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$UsersFailureImpl>
    implements _$$UsersFailureImplCopyWith<$Res> {
  __$$UsersFailureImplCopyWithImpl(
    _$UsersFailureImpl _value,
    $Res Function(_$UsersFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UsersFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UsersFailureImpl implements UsersFailure {
  const _$UsersFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UsersState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersFailureImplCopyWith<_$UsersFailureImpl> get copyWith =>
      __$$UsersFailureImplCopyWithImpl<_$UsersFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserSummary> users) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserSummary> users)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserSummary> users)? loaded,
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
    required TResult Function(UsersInitial value) initial,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersLoaded value) loaded,
    required TResult Function(UsersFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersInitial value)? initial,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersLoaded value)? loaded,
    TResult? Function(UsersFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersInitial value)? initial,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersLoaded value)? loaded,
    TResult Function(UsersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UsersFailure implements UsersState {
  const factory UsersFailure(final String message) = _$UsersFailureImpl;

  String get message;

  /// Create a copy of UsersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersFailureImplCopyWith<_$UsersFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
