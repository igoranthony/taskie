// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_columns_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectColumnsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectColumnsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectColumnsState()';
}


}

/// @nodoc
class $ProjectColumnsStateCopyWith<$Res>  {
$ProjectColumnsStateCopyWith(ProjectColumnsState _, $Res Function(ProjectColumnsState) __);
}


/// Adds pattern-matching-related methods to [ProjectColumnsState].
extension ProjectColumnsStatePatterns on ProjectColumnsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectColumnsInitial value)?  initial,TResult Function( ProjectColumnsLoading value)?  loading,TResult Function( ProjectColumnsLoaded value)?  loaded,TResult Function( ProjectColumnsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectColumnsInitial() when initial != null:
return initial(_that);case ProjectColumnsLoading() when loading != null:
return loading(_that);case ProjectColumnsLoaded() when loaded != null:
return loaded(_that);case ProjectColumnsFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectColumnsInitial value)  initial,required TResult Function( ProjectColumnsLoading value)  loading,required TResult Function( ProjectColumnsLoaded value)  loaded,required TResult Function( ProjectColumnsFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProjectColumnsInitial():
return initial(_that);case ProjectColumnsLoading():
return loading(_that);case ProjectColumnsLoaded():
return loaded(_that);case ProjectColumnsFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectColumnsInitial value)?  initial,TResult? Function( ProjectColumnsLoading value)?  loading,TResult? Function( ProjectColumnsLoaded value)?  loaded,TResult? Function( ProjectColumnsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProjectColumnsInitial() when initial != null:
return initial(_that);case ProjectColumnsLoading() when loading != null:
return loading(_that);case ProjectColumnsLoaded() when loaded != null:
return loaded(_that);case ProjectColumnsFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProjectColumn> columns)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectColumnsInitial() when initial != null:
return initial();case ProjectColumnsLoading() when loading != null:
return loading();case ProjectColumnsLoaded() when loaded != null:
return loaded(_that.columns);case ProjectColumnsFailure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProjectColumn> columns)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProjectColumnsInitial():
return initial();case ProjectColumnsLoading():
return loading();case ProjectColumnsLoaded():
return loaded(_that.columns);case ProjectColumnsFailure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProjectColumn> columns)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProjectColumnsInitial() when initial != null:
return initial();case ProjectColumnsLoading() when loading != null:
return loading();case ProjectColumnsLoaded() when loaded != null:
return loaded(_that.columns);case ProjectColumnsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectColumnsInitial implements ProjectColumnsState {
  const ProjectColumnsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectColumnsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectColumnsState.initial()';
}


}




/// @nodoc


class ProjectColumnsLoading implements ProjectColumnsState {
  const ProjectColumnsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectColumnsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectColumnsState.loading()';
}


}




/// @nodoc


class ProjectColumnsLoaded implements ProjectColumnsState {
  const ProjectColumnsLoaded(final  List<ProjectColumn> columns): _columns = columns;
  

 final  List<ProjectColumn> _columns;
 List<ProjectColumn> get columns {
  if (_columns is EqualUnmodifiableListView) return _columns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_columns);
}


/// Create a copy of ProjectColumnsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectColumnsLoadedCopyWith<ProjectColumnsLoaded> get copyWith => _$ProjectColumnsLoadedCopyWithImpl<ProjectColumnsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectColumnsLoaded&&const DeepCollectionEquality().equals(other._columns, _columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_columns));

@override
String toString() {
  return 'ProjectColumnsState.loaded(columns: $columns)';
}


}

/// @nodoc
abstract mixin class $ProjectColumnsLoadedCopyWith<$Res> implements $ProjectColumnsStateCopyWith<$Res> {
  factory $ProjectColumnsLoadedCopyWith(ProjectColumnsLoaded value, $Res Function(ProjectColumnsLoaded) _then) = _$ProjectColumnsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProjectColumn> columns
});




}
/// @nodoc
class _$ProjectColumnsLoadedCopyWithImpl<$Res>
    implements $ProjectColumnsLoadedCopyWith<$Res> {
  _$ProjectColumnsLoadedCopyWithImpl(this._self, this._then);

  final ProjectColumnsLoaded _self;
  final $Res Function(ProjectColumnsLoaded) _then;

/// Create a copy of ProjectColumnsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? columns = null,}) {
  return _then(ProjectColumnsLoaded(
null == columns ? _self._columns : columns // ignore: cast_nullable_to_non_nullable
as List<ProjectColumn>,
  ));
}


}

/// @nodoc


class ProjectColumnsFailure implements ProjectColumnsState {
  const ProjectColumnsFailure(this.message);
  

 final  String message;

/// Create a copy of ProjectColumnsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectColumnsFailureCopyWith<ProjectColumnsFailure> get copyWith => _$ProjectColumnsFailureCopyWithImpl<ProjectColumnsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectColumnsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectColumnsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectColumnsFailureCopyWith<$Res> implements $ProjectColumnsStateCopyWith<$Res> {
  factory $ProjectColumnsFailureCopyWith(ProjectColumnsFailure value, $Res Function(ProjectColumnsFailure) _then) = _$ProjectColumnsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectColumnsFailureCopyWithImpl<$Res>
    implements $ProjectColumnsFailureCopyWith<$Res> {
  _$ProjectColumnsFailureCopyWithImpl(this._self, this._then);

  final ProjectColumnsFailure _self;
  final $Res Function(ProjectColumnsFailure) _then;

/// Create a copy of ProjectColumnsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectColumnsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
