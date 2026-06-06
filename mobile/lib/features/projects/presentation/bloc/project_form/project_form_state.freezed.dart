// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFormState()';
}


}

/// @nodoc
class $ProjectFormStateCopyWith<$Res>  {
$ProjectFormStateCopyWith(ProjectFormState _, $Res Function(ProjectFormState) __);
}


/// Adds pattern-matching-related methods to [ProjectFormState].
extension ProjectFormStatePatterns on ProjectFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectFormInitial value)?  initial,TResult Function( ProjectFormLoading value)?  loading,TResult Function( ProjectFormSuccess value)?  success,TResult Function( ProjectFormFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectFormInitial() when initial != null:
return initial(_that);case ProjectFormLoading() when loading != null:
return loading(_that);case ProjectFormSuccess() when success != null:
return success(_that);case ProjectFormFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectFormInitial value)  initial,required TResult Function( ProjectFormLoading value)  loading,required TResult Function( ProjectFormSuccess value)  success,required TResult Function( ProjectFormFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProjectFormInitial():
return initial(_that);case ProjectFormLoading():
return loading(_that);case ProjectFormSuccess():
return success(_that);case ProjectFormFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectFormInitial value)?  initial,TResult? Function( ProjectFormLoading value)?  loading,TResult? Function( ProjectFormSuccess value)?  success,TResult? Function( ProjectFormFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProjectFormInitial() when initial != null:
return initial(_that);case ProjectFormLoading() when loading != null:
return loading(_that);case ProjectFormSuccess() when success != null:
return success(_that);case ProjectFormFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Project project)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectFormInitial() when initial != null:
return initial();case ProjectFormLoading() when loading != null:
return loading();case ProjectFormSuccess() when success != null:
return success(_that.project);case ProjectFormFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Project project)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProjectFormInitial():
return initial();case ProjectFormLoading():
return loading();case ProjectFormSuccess():
return success(_that.project);case ProjectFormFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Project project)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProjectFormInitial() when initial != null:
return initial();case ProjectFormLoading() when loading != null:
return loading();case ProjectFormSuccess() when success != null:
return success(_that.project);case ProjectFormFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectFormInitial implements ProjectFormState {
  const ProjectFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFormState.initial()';
}


}




/// @nodoc


class ProjectFormLoading implements ProjectFormState {
  const ProjectFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFormState.loading()';
}


}




/// @nodoc


class ProjectFormSuccess implements ProjectFormState {
  const ProjectFormSuccess(this.project);
  

 final  Project project;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFormSuccessCopyWith<ProjectFormSuccess> get copyWith => _$ProjectFormSuccessCopyWithImpl<ProjectFormSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormSuccess&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectFormState.success(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectFormSuccessCopyWith<$Res> implements $ProjectFormStateCopyWith<$Res> {
  factory $ProjectFormSuccessCopyWith(ProjectFormSuccess value, $Res Function(ProjectFormSuccess) _then) = _$ProjectFormSuccessCopyWithImpl;
@useResult
$Res call({
 Project project
});




}
/// @nodoc
class _$ProjectFormSuccessCopyWithImpl<$Res>
    implements $ProjectFormSuccessCopyWith<$Res> {
  _$ProjectFormSuccessCopyWithImpl(this._self, this._then);

  final ProjectFormSuccess _self;
  final $Res Function(ProjectFormSuccess) _then;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectFormSuccess(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,
  ));
}


}

/// @nodoc


class ProjectFormFailure implements ProjectFormState {
  const ProjectFormFailure(this.message);
  

 final  String message;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFormFailureCopyWith<ProjectFormFailure> get copyWith => _$ProjectFormFailureCopyWithImpl<ProjectFormFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectFormState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectFormFailureCopyWith<$Res> implements $ProjectFormStateCopyWith<$Res> {
  factory $ProjectFormFailureCopyWith(ProjectFormFailure value, $Res Function(ProjectFormFailure) _then) = _$ProjectFormFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectFormFailureCopyWithImpl<$Res>
    implements $ProjectFormFailureCopyWith<$Res> {
  _$ProjectFormFailureCopyWithImpl(this._self, this._then);

  final ProjectFormFailure _self;
  final $Res Function(ProjectFormFailure) _then;

/// Create a copy of ProjectFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectFormFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
