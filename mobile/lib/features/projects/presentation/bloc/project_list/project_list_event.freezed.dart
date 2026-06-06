// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectListEvent()';
}


}

/// @nodoc
class $ProjectListEventCopyWith<$Res>  {
$ProjectListEventCopyWith(ProjectListEvent _, $Res Function(ProjectListEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectListEvent].
extension ProjectListEventPatterns on ProjectListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectListLoaded value)?  loaded,TResult Function( ProjectListRefreshed value)?  refreshed,TResult Function( ProjectListStatusChanged value)?  statusChanged,TResult Function( ProjectListDeleted value)?  deleted,TResult Function( ProjectListProjectUpserted value)?  projectUpserted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectListLoaded() when loaded != null:
return loaded(_that);case ProjectListRefreshed() when refreshed != null:
return refreshed(_that);case ProjectListStatusChanged() when statusChanged != null:
return statusChanged(_that);case ProjectListDeleted() when deleted != null:
return deleted(_that);case ProjectListProjectUpserted() when projectUpserted != null:
return projectUpserted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectListLoaded value)  loaded,required TResult Function( ProjectListRefreshed value)  refreshed,required TResult Function( ProjectListStatusChanged value)  statusChanged,required TResult Function( ProjectListDeleted value)  deleted,required TResult Function( ProjectListProjectUpserted value)  projectUpserted,}){
final _that = this;
switch (_that) {
case ProjectListLoaded():
return loaded(_that);case ProjectListRefreshed():
return refreshed(_that);case ProjectListStatusChanged():
return statusChanged(_that);case ProjectListDeleted():
return deleted(_that);case ProjectListProjectUpserted():
return projectUpserted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectListLoaded value)?  loaded,TResult? Function( ProjectListRefreshed value)?  refreshed,TResult? Function( ProjectListStatusChanged value)?  statusChanged,TResult? Function( ProjectListDeleted value)?  deleted,TResult? Function( ProjectListProjectUpserted value)?  projectUpserted,}){
final _that = this;
switch (_that) {
case ProjectListLoaded() when loaded != null:
return loaded(_that);case ProjectListRefreshed() when refreshed != null:
return refreshed(_that);case ProjectListStatusChanged() when statusChanged != null:
return statusChanged(_that);case ProjectListDeleted() when deleted != null:
return deleted(_that);case ProjectListProjectUpserted() when projectUpserted != null:
return projectUpserted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loaded,TResult Function()?  refreshed,TResult Function( String id,  ProjectStatus status)?  statusChanged,TResult Function( String id)?  deleted,TResult Function( Project project)?  projectUpserted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectListLoaded() when loaded != null:
return loaded();case ProjectListRefreshed() when refreshed != null:
return refreshed();case ProjectListStatusChanged() when statusChanged != null:
return statusChanged(_that.id,_that.status);case ProjectListDeleted() when deleted != null:
return deleted(_that.id);case ProjectListProjectUpserted() when projectUpserted != null:
return projectUpserted(_that.project);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loaded,required TResult Function()  refreshed,required TResult Function( String id,  ProjectStatus status)  statusChanged,required TResult Function( String id)  deleted,required TResult Function( Project project)  projectUpserted,}) {final _that = this;
switch (_that) {
case ProjectListLoaded():
return loaded();case ProjectListRefreshed():
return refreshed();case ProjectListStatusChanged():
return statusChanged(_that.id,_that.status);case ProjectListDeleted():
return deleted(_that.id);case ProjectListProjectUpserted():
return projectUpserted(_that.project);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loaded,TResult? Function()?  refreshed,TResult? Function( String id,  ProjectStatus status)?  statusChanged,TResult? Function( String id)?  deleted,TResult? Function( Project project)?  projectUpserted,}) {final _that = this;
switch (_that) {
case ProjectListLoaded() when loaded != null:
return loaded();case ProjectListRefreshed() when refreshed != null:
return refreshed();case ProjectListStatusChanged() when statusChanged != null:
return statusChanged(_that.id,_that.status);case ProjectListDeleted() when deleted != null:
return deleted(_that.id);case ProjectListProjectUpserted() when projectUpserted != null:
return projectUpserted(_that.project);case _:
  return null;

}
}

}

/// @nodoc


class ProjectListLoaded implements ProjectListEvent {
  const ProjectListLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectListEvent.loaded()';
}


}




/// @nodoc


class ProjectListRefreshed implements ProjectListEvent {
  const ProjectListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectListEvent.refreshed()';
}


}




/// @nodoc


class ProjectListStatusChanged implements ProjectListEvent {
  const ProjectListStatusChanged(this.id, this.status);
  

 final  String id;
 final  ProjectStatus status;

/// Create a copy of ProjectListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListStatusChangedCopyWith<ProjectListStatusChanged> get copyWith => _$ProjectListStatusChangedCopyWithImpl<ProjectListStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListStatusChanged&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'ProjectListEvent.statusChanged(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class $ProjectListStatusChangedCopyWith<$Res> implements $ProjectListEventCopyWith<$Res> {
  factory $ProjectListStatusChangedCopyWith(ProjectListStatusChanged value, $Res Function(ProjectListStatusChanged) _then) = _$ProjectListStatusChangedCopyWithImpl;
@useResult
$Res call({
 String id, ProjectStatus status
});




}
/// @nodoc
class _$ProjectListStatusChangedCopyWithImpl<$Res>
    implements $ProjectListStatusChangedCopyWith<$Res> {
  _$ProjectListStatusChangedCopyWithImpl(this._self, this._then);

  final ProjectListStatusChanged _self;
  final $Res Function(ProjectListStatusChanged) _then;

/// Create a copy of ProjectListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,}) {
  return _then(ProjectListStatusChanged(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,
  ));
}


}

/// @nodoc


class ProjectListDeleted implements ProjectListEvent {
  const ProjectListDeleted(this.id);
  

 final  String id;

/// Create a copy of ProjectListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListDeletedCopyWith<ProjectListDeleted> get copyWith => _$ProjectListDeletedCopyWithImpl<ProjectListDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProjectListEvent.deleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProjectListDeletedCopyWith<$Res> implements $ProjectListEventCopyWith<$Res> {
  factory $ProjectListDeletedCopyWith(ProjectListDeleted value, $Res Function(ProjectListDeleted) _then) = _$ProjectListDeletedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProjectListDeletedCopyWithImpl<$Res>
    implements $ProjectListDeletedCopyWith<$Res> {
  _$ProjectListDeletedCopyWithImpl(this._self, this._then);

  final ProjectListDeleted _self;
  final $Res Function(ProjectListDeleted) _then;

/// Create a copy of ProjectListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProjectListDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectListProjectUpserted implements ProjectListEvent {
  const ProjectListProjectUpserted(this.project);
  

 final  Project project;

/// Create a copy of ProjectListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListProjectUpsertedCopyWith<ProjectListProjectUpserted> get copyWith => _$ProjectListProjectUpsertedCopyWithImpl<ProjectListProjectUpserted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListProjectUpserted&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectListEvent.projectUpserted(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectListProjectUpsertedCopyWith<$Res> implements $ProjectListEventCopyWith<$Res> {
  factory $ProjectListProjectUpsertedCopyWith(ProjectListProjectUpserted value, $Res Function(ProjectListProjectUpserted) _then) = _$ProjectListProjectUpsertedCopyWithImpl;
@useResult
$Res call({
 Project project
});




}
/// @nodoc
class _$ProjectListProjectUpsertedCopyWithImpl<$Res>
    implements $ProjectListProjectUpsertedCopyWith<$Res> {
  _$ProjectListProjectUpsertedCopyWithImpl(this._self, this._then);

  final ProjectListProjectUpserted _self;
  final $Res Function(ProjectListProjectUpserted) _then;

/// Create a copy of ProjectListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectListProjectUpserted(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,
  ));
}


}

// dart format on
