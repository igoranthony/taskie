// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectListState()';
}


}

/// @nodoc
class $ProjectListStateCopyWith<$Res>  {
$ProjectListStateCopyWith(ProjectListState _, $Res Function(ProjectListState) __);
}


/// Adds pattern-matching-related methods to [ProjectListState].
extension ProjectListStatePatterns on ProjectListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectListInitial value)?  initial,TResult Function( ProjectListLoading value)?  loading,TResult Function( ProjectListSuccess value)?  success,TResult Function( ProjectListFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectListInitial() when initial != null:
return initial(_that);case ProjectListLoading() when loading != null:
return loading(_that);case ProjectListSuccess() when success != null:
return success(_that);case ProjectListFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectListInitial value)  initial,required TResult Function( ProjectListLoading value)  loading,required TResult Function( ProjectListSuccess value)  success,required TResult Function( ProjectListFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProjectListInitial():
return initial(_that);case ProjectListLoading():
return loading(_that);case ProjectListSuccess():
return success(_that);case ProjectListFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectListInitial value)?  initial,TResult? Function( ProjectListLoading value)?  loading,TResult? Function( ProjectListSuccess value)?  success,TResult? Function( ProjectListFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProjectListInitial() when initial != null:
return initial(_that);case ProjectListLoading() when loading != null:
return loading(_that);case ProjectListSuccess() when success != null:
return success(_that);case ProjectListFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Project> projects)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectListInitial() when initial != null:
return initial();case ProjectListLoading() when loading != null:
return loading();case ProjectListSuccess() when success != null:
return success(_that.projects);case ProjectListFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Project> projects)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProjectListInitial():
return initial();case ProjectListLoading():
return loading();case ProjectListSuccess():
return success(_that.projects);case ProjectListFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Project> projects)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProjectListInitial() when initial != null:
return initial();case ProjectListLoading() when loading != null:
return loading();case ProjectListSuccess() when success != null:
return success(_that.projects);case ProjectListFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectListInitial implements ProjectListState {
  const ProjectListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectListState.initial()';
}


}




/// @nodoc


class ProjectListLoading implements ProjectListState {
  const ProjectListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectListState.loading()';
}


}




/// @nodoc


class ProjectListSuccess implements ProjectListState {
  const ProjectListSuccess({required final  List<Project> projects}): _projects = projects;
  

 final  List<Project> _projects;
 List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListSuccessCopyWith<ProjectListSuccess> get copyWith => _$ProjectListSuccessCopyWithImpl<ProjectListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListSuccess&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'ProjectListState.success(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $ProjectListSuccessCopyWith<$Res> implements $ProjectListStateCopyWith<$Res> {
  factory $ProjectListSuccessCopyWith(ProjectListSuccess value, $Res Function(ProjectListSuccess) _then) = _$ProjectListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Project> projects
});




}
/// @nodoc
class _$ProjectListSuccessCopyWithImpl<$Res>
    implements $ProjectListSuccessCopyWith<$Res> {
  _$ProjectListSuccessCopyWithImpl(this._self, this._then);

  final ProjectListSuccess _self;
  final $Res Function(ProjectListSuccess) _then;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(ProjectListSuccess(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,
  ));
}


}

/// @nodoc


class ProjectListFailure implements ProjectListState {
  const ProjectListFailure(this.message);
  

 final  String message;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListFailureCopyWith<ProjectListFailure> get copyWith => _$ProjectListFailureCopyWithImpl<ProjectListFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectListFailureCopyWith<$Res> implements $ProjectListStateCopyWith<$Res> {
  factory $ProjectListFailureCopyWith(ProjectListFailure value, $Res Function(ProjectListFailure) _then) = _$ProjectListFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectListFailureCopyWithImpl<$Res>
    implements $ProjectListFailureCopyWith<$Res> {
  _$ProjectListFailureCopyWithImpl(this._self, this._then);

  final ProjectListFailure _self;
  final $Res Function(ProjectListFailure) _then;

/// Create a copy of ProjectListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectListFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
