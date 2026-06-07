// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_share_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectShareState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectShareState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectShareState()';
}


}

/// @nodoc
class $ProjectShareStateCopyWith<$Res>  {
$ProjectShareStateCopyWith(ProjectShareState _, $Res Function(ProjectShareState) __);
}


/// Adds pattern-matching-related methods to [ProjectShareState].
extension ProjectShareStatePatterns on ProjectShareState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectShareInitial value)?  initial,TResult Function( ProjectShareLoading value)?  loading,TResult Function( ProjectShareLoaded value)?  loaded,TResult Function( ProjectShareFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectShareInitial() when initial != null:
return initial(_that);case ProjectShareLoading() when loading != null:
return loading(_that);case ProjectShareLoaded() when loaded != null:
return loaded(_that);case ProjectShareFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectShareInitial value)  initial,required TResult Function( ProjectShareLoading value)  loading,required TResult Function( ProjectShareLoaded value)  loaded,required TResult Function( ProjectShareFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProjectShareInitial():
return initial(_that);case ProjectShareLoading():
return loading(_that);case ProjectShareLoaded():
return loaded(_that);case ProjectShareFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectShareInitial value)?  initial,TResult? Function( ProjectShareLoading value)?  loading,TResult? Function( ProjectShareLoaded value)?  loaded,TResult? Function( ProjectShareFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProjectShareInitial() when initial != null:
return initial(_that);case ProjectShareLoading() when loading != null:
return loading(_that);case ProjectShareLoaded() when loaded != null:
return loaded(_that);case ProjectShareFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String inviteCode,  List<ProjectMember> members)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectShareInitial() when initial != null:
return initial();case ProjectShareLoading() when loading != null:
return loading();case ProjectShareLoaded() when loaded != null:
return loaded(_that.inviteCode,_that.members);case ProjectShareFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String inviteCode,  List<ProjectMember> members)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProjectShareInitial():
return initial();case ProjectShareLoading():
return loading();case ProjectShareLoaded():
return loaded(_that.inviteCode,_that.members);case ProjectShareFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String inviteCode,  List<ProjectMember> members)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProjectShareInitial() when initial != null:
return initial();case ProjectShareLoading() when loading != null:
return loading();case ProjectShareLoaded() when loaded != null:
return loaded(_that.inviteCode,_that.members);case ProjectShareFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectShareInitial implements ProjectShareState {
  const ProjectShareInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectShareInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectShareState.initial()';
}


}




/// @nodoc


class ProjectShareLoading implements ProjectShareState {
  const ProjectShareLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectShareLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectShareState.loading()';
}


}




/// @nodoc


class ProjectShareLoaded implements ProjectShareState {
  const ProjectShareLoaded({required this.inviteCode, required final  List<ProjectMember> members}): _members = members;
  

 final  String inviteCode;
 final  List<ProjectMember> _members;
 List<ProjectMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of ProjectShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectShareLoadedCopyWith<ProjectShareLoaded> get copyWith => _$ProjectShareLoadedCopyWithImpl<ProjectShareLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectShareLoaded&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&const DeepCollectionEquality().equals(other._members, _members));
}


@override
int get hashCode => Object.hash(runtimeType,inviteCode,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'ProjectShareState.loaded(inviteCode: $inviteCode, members: $members)';
}


}

/// @nodoc
abstract mixin class $ProjectShareLoadedCopyWith<$Res> implements $ProjectShareStateCopyWith<$Res> {
  factory $ProjectShareLoadedCopyWith(ProjectShareLoaded value, $Res Function(ProjectShareLoaded) _then) = _$ProjectShareLoadedCopyWithImpl;
@useResult
$Res call({
 String inviteCode, List<ProjectMember> members
});




}
/// @nodoc
class _$ProjectShareLoadedCopyWithImpl<$Res>
    implements $ProjectShareLoadedCopyWith<$Res> {
  _$ProjectShareLoadedCopyWithImpl(this._self, this._then);

  final ProjectShareLoaded _self;
  final $Res Function(ProjectShareLoaded) _then;

/// Create a copy of ProjectShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inviteCode = null,Object? members = null,}) {
  return _then(ProjectShareLoaded(
inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<ProjectMember>,
  ));
}


}

/// @nodoc


class ProjectShareFailure implements ProjectShareState {
  const ProjectShareFailure(this.message);
  

 final  String message;

/// Create a copy of ProjectShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectShareFailureCopyWith<ProjectShareFailure> get copyWith => _$ProjectShareFailureCopyWithImpl<ProjectShareFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectShareFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectShareState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectShareFailureCopyWith<$Res> implements $ProjectShareStateCopyWith<$Res> {
  factory $ProjectShareFailureCopyWith(ProjectShareFailure value, $Res Function(ProjectShareFailure) _then) = _$ProjectShareFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectShareFailureCopyWithImpl<$Res>
    implements $ProjectShareFailureCopyWith<$Res> {
  _$ProjectShareFailureCopyWithImpl(this._self, this._then);

  final ProjectShareFailure _self;
  final $Res Function(ProjectShareFailure) _then;

/// Create a copy of ProjectShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectShareFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
