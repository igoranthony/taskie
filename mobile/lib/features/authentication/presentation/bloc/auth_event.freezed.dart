// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String username, String password) loginRequested,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String username, String password)? loginRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String username, String password)? loginRequested,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) checkRequested,
    required TResult Function(AuthLoginRequested value) loginRequested,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(AuthSessionExpired value) sessionExpired,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequested value)? checkRequested,
    TResult? Function(AuthLoginRequested value)? loginRequested,
    TResult? Function(AuthLogoutRequested value)? logoutRequested,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? checkRequested,
    TResult Function(AuthLoginRequested value)? loginRequested,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthCheckRequestedImplCopyWith<$Res> {
  factory _$$AuthCheckRequestedImplCopyWith(
    _$AuthCheckRequestedImpl value,
    $Res Function(_$AuthCheckRequestedImpl) then,
  ) = __$$AuthCheckRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCheckRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckRequestedImpl>
    implements _$$AuthCheckRequestedImplCopyWith<$Res> {
  __$$AuthCheckRequestedImplCopyWithImpl(
    _$AuthCheckRequestedImpl _value,
    $Res Function(_$AuthCheckRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthCheckRequestedImpl implements AuthCheckRequested {
  const _$AuthCheckRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.checkRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthCheckRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String username, String password) loginRequested,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return checkRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String username, String password)? loginRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return checkRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String username, String password)? loginRequested,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (checkRequested != null) {
      return checkRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) checkRequested,
    required TResult Function(AuthLoginRequested value) loginRequested,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(AuthSessionExpired value) sessionExpired,
  }) {
    return checkRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequested value)? checkRequested,
    TResult? Function(AuthLoginRequested value)? loginRequested,
    TResult? Function(AuthLogoutRequested value)? logoutRequested,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
  }) {
    return checkRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? checkRequested,
    TResult Function(AuthLoginRequested value)? loginRequested,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (checkRequested != null) {
      return checkRequested(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequested implements AuthEvent {
  const factory AuthCheckRequested() = _$AuthCheckRequestedImpl;
}

/// @nodoc
abstract class _$$AuthLoginRequestedImplCopyWith<$Res> {
  factory _$$AuthLoginRequestedImplCopyWith(
    _$AuthLoginRequestedImpl value,
    $Res Function(_$AuthLoginRequestedImpl) then,
  ) = __$$AuthLoginRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$AuthLoginRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginRequestedImpl>
    implements _$$AuthLoginRequestedImplCopyWith<$Res> {
  __$$AuthLoginRequestedImplCopyWithImpl(
    _$AuthLoginRequestedImpl _value,
    $Res Function(_$AuthLoginRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? username = null, Object? password = null}) {
    return _then(
      _$AuthLoginRequestedImpl(
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthLoginRequestedImpl implements AuthLoginRequested {
  const _$AuthLoginRequestedImpl({
    required this.username,
    required this.password,
  });

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginRequested(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginRequestedImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginRequestedImplCopyWith<_$AuthLoginRequestedImpl> get copyWith =>
      __$$AuthLoginRequestedImplCopyWithImpl<_$AuthLoginRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String username, String password) loginRequested,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return loginRequested(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String username, String password)? loginRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return loginRequested?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String username, String password)? loginRequested,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) checkRequested,
    required TResult Function(AuthLoginRequested value) loginRequested,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(AuthSessionExpired value) sessionExpired,
  }) {
    return loginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequested value)? checkRequested,
    TResult? Function(AuthLoginRequested value)? loginRequested,
    TResult? Function(AuthLogoutRequested value)? logoutRequested,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
  }) {
    return loginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? checkRequested,
    TResult Function(AuthLoginRequested value)? loginRequested,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(this);
    }
    return orElse();
  }
}

abstract class AuthLoginRequested implements AuthEvent {
  const factory AuthLoginRequested({
    required final String username,
    required final String password,
  }) = _$AuthLoginRequestedImpl;

  String get username;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthLoginRequestedImplCopyWith<_$AuthLoginRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutRequestedImplCopyWith<$Res> {
  factory _$$AuthLogoutRequestedImplCopyWith(
    _$AuthLogoutRequestedImpl value,
    $Res Function(_$AuthLogoutRequestedImpl) then,
  ) = __$$AuthLogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutRequestedImpl>
    implements _$$AuthLogoutRequestedImplCopyWith<$Res> {
  __$$AuthLogoutRequestedImplCopyWithImpl(
    _$AuthLogoutRequestedImpl _value,
    $Res Function(_$AuthLogoutRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLogoutRequestedImpl implements AuthLogoutRequested {
  const _$AuthLogoutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String username, String password) loginRequested,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String username, String password)? loginRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String username, String password)? loginRequested,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) checkRequested,
    required TResult Function(AuthLoginRequested value) loginRequested,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(AuthSessionExpired value) sessionExpired,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequested value)? checkRequested,
    TResult? Function(AuthLoginRequested value)? loginRequested,
    TResult? Function(AuthLogoutRequested value)? logoutRequested,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? checkRequested,
    TResult Function(AuthLoginRequested value)? loginRequested,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class AuthLogoutRequested implements AuthEvent {
  const factory AuthLogoutRequested() = _$AuthLogoutRequestedImpl;
}

/// @nodoc
abstract class _$$AuthSessionExpiredImplCopyWith<$Res> {
  factory _$$AuthSessionExpiredImplCopyWith(
    _$AuthSessionExpiredImpl value,
    $Res Function(_$AuthSessionExpiredImpl) then,
  ) = __$$AuthSessionExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSessionExpiredImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSessionExpiredImpl>
    implements _$$AuthSessionExpiredImplCopyWith<$Res> {
  __$$AuthSessionExpiredImplCopyWithImpl(
    _$AuthSessionExpiredImpl _value,
    $Res Function(_$AuthSessionExpiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthSessionExpiredImpl implements AuthSessionExpired {
  const _$AuthSessionExpiredImpl();

  @override
  String toString() {
    return 'AuthEvent.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSessionExpiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkRequested,
    required TResult Function(String username, String password) loginRequested,
    required TResult Function() logoutRequested,
    required TResult Function() sessionExpired,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkRequested,
    TResult? Function(String username, String password)? loginRequested,
    TResult? Function()? logoutRequested,
    TResult? Function()? sessionExpired,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkRequested,
    TResult Function(String username, String password)? loginRequested,
    TResult Function()? logoutRequested,
    TResult Function()? sessionExpired,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthCheckRequested value) checkRequested,
    required TResult Function(AuthLoginRequested value) loginRequested,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(AuthSessionExpired value) sessionExpired,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthCheckRequested value)? checkRequested,
    TResult? Function(AuthLoginRequested value)? loginRequested,
    TResult? Function(AuthLogoutRequested value)? logoutRequested,
    TResult? Function(AuthSessionExpired value)? sessionExpired,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthCheckRequested value)? checkRequested,
    TResult Function(AuthLoginRequested value)? loginRequested,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(AuthSessionExpired value)? sessionExpired,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class AuthSessionExpired implements AuthEvent {
  const factory AuthSessionExpired() = _$AuthSessionExpiredImpl;
}
