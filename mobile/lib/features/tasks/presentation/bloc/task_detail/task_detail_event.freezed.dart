// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailEvent()';
}


}

/// @nodoc
class $TaskDetailEventCopyWith<$Res>  {
$TaskDetailEventCopyWith(TaskDetailEvent _, $Res Function(TaskDetailEvent) __);
}


/// Adds pattern-matching-related methods to [TaskDetailEvent].
extension TaskDetailEventPatterns on TaskDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskDetailLoaded value)?  loaded,TResult Function( TaskDetailRefreshed value)?  refreshed,TResult Function( TaskDetailSubtaskAdded value)?  subtaskAdded,TResult Function( TaskDetailSubtaskToggled value)?  subtaskToggled,TResult Function( TaskDetailSubtaskDeleted value)?  subtaskDeleted,TResult Function( TaskDetailAttachmentUploaded value)?  attachmentUploaded,TResult Function( TaskDetailAttachmentDeleted value)?  attachmentDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that);case TaskDetailRefreshed() when refreshed != null:
return refreshed(_that);case TaskDetailSubtaskAdded() when subtaskAdded != null:
return subtaskAdded(_that);case TaskDetailSubtaskToggled() when subtaskToggled != null:
return subtaskToggled(_that);case TaskDetailSubtaskDeleted() when subtaskDeleted != null:
return subtaskDeleted(_that);case TaskDetailAttachmentUploaded() when attachmentUploaded != null:
return attachmentUploaded(_that);case TaskDetailAttachmentDeleted() when attachmentDeleted != null:
return attachmentDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskDetailLoaded value)  loaded,required TResult Function( TaskDetailRefreshed value)  refreshed,required TResult Function( TaskDetailSubtaskAdded value)  subtaskAdded,required TResult Function( TaskDetailSubtaskToggled value)  subtaskToggled,required TResult Function( TaskDetailSubtaskDeleted value)  subtaskDeleted,required TResult Function( TaskDetailAttachmentUploaded value)  attachmentUploaded,required TResult Function( TaskDetailAttachmentDeleted value)  attachmentDeleted,}){
final _that = this;
switch (_that) {
case TaskDetailLoaded():
return loaded(_that);case TaskDetailRefreshed():
return refreshed(_that);case TaskDetailSubtaskAdded():
return subtaskAdded(_that);case TaskDetailSubtaskToggled():
return subtaskToggled(_that);case TaskDetailSubtaskDeleted():
return subtaskDeleted(_that);case TaskDetailAttachmentUploaded():
return attachmentUploaded(_that);case TaskDetailAttachmentDeleted():
return attachmentDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskDetailLoaded value)?  loaded,TResult? Function( TaskDetailRefreshed value)?  refreshed,TResult? Function( TaskDetailSubtaskAdded value)?  subtaskAdded,TResult? Function( TaskDetailSubtaskToggled value)?  subtaskToggled,TResult? Function( TaskDetailSubtaskDeleted value)?  subtaskDeleted,TResult? Function( TaskDetailAttachmentUploaded value)?  attachmentUploaded,TResult? Function( TaskDetailAttachmentDeleted value)?  attachmentDeleted,}){
final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that);case TaskDetailRefreshed() when refreshed != null:
return refreshed(_that);case TaskDetailSubtaskAdded() when subtaskAdded != null:
return subtaskAdded(_that);case TaskDetailSubtaskToggled() when subtaskToggled != null:
return subtaskToggled(_that);case TaskDetailSubtaskDeleted() when subtaskDeleted != null:
return subtaskDeleted(_that);case TaskDetailAttachmentUploaded() when attachmentUploaded != null:
return attachmentUploaded(_that);case TaskDetailAttachmentDeleted() when attachmentDeleted != null:
return attachmentDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String taskId)?  loaded,TResult Function()?  refreshed,TResult Function( String titulo)?  subtaskAdded,TResult Function( String subtaskId)?  subtaskToggled,TResult Function( String subtaskId)?  subtaskDeleted,TResult Function( File arquivo)?  attachmentUploaded,TResult Function( String attachmentId)?  attachmentDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that.taskId);case TaskDetailRefreshed() when refreshed != null:
return refreshed();case TaskDetailSubtaskAdded() when subtaskAdded != null:
return subtaskAdded(_that.titulo);case TaskDetailSubtaskToggled() when subtaskToggled != null:
return subtaskToggled(_that.subtaskId);case TaskDetailSubtaskDeleted() when subtaskDeleted != null:
return subtaskDeleted(_that.subtaskId);case TaskDetailAttachmentUploaded() when attachmentUploaded != null:
return attachmentUploaded(_that.arquivo);case TaskDetailAttachmentDeleted() when attachmentDeleted != null:
return attachmentDeleted(_that.attachmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String taskId)  loaded,required TResult Function()  refreshed,required TResult Function( String titulo)  subtaskAdded,required TResult Function( String subtaskId)  subtaskToggled,required TResult Function( String subtaskId)  subtaskDeleted,required TResult Function( File arquivo)  attachmentUploaded,required TResult Function( String attachmentId)  attachmentDeleted,}) {final _that = this;
switch (_that) {
case TaskDetailLoaded():
return loaded(_that.taskId);case TaskDetailRefreshed():
return refreshed();case TaskDetailSubtaskAdded():
return subtaskAdded(_that.titulo);case TaskDetailSubtaskToggled():
return subtaskToggled(_that.subtaskId);case TaskDetailSubtaskDeleted():
return subtaskDeleted(_that.subtaskId);case TaskDetailAttachmentUploaded():
return attachmentUploaded(_that.arquivo);case TaskDetailAttachmentDeleted():
return attachmentDeleted(_that.attachmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String taskId)?  loaded,TResult? Function()?  refreshed,TResult? Function( String titulo)?  subtaskAdded,TResult? Function( String subtaskId)?  subtaskToggled,TResult? Function( String subtaskId)?  subtaskDeleted,TResult? Function( File arquivo)?  attachmentUploaded,TResult? Function( String attachmentId)?  attachmentDeleted,}) {final _that = this;
switch (_that) {
case TaskDetailLoaded() when loaded != null:
return loaded(_that.taskId);case TaskDetailRefreshed() when refreshed != null:
return refreshed();case TaskDetailSubtaskAdded() when subtaskAdded != null:
return subtaskAdded(_that.titulo);case TaskDetailSubtaskToggled() when subtaskToggled != null:
return subtaskToggled(_that.subtaskId);case TaskDetailSubtaskDeleted() when subtaskDeleted != null:
return subtaskDeleted(_that.subtaskId);case TaskDetailAttachmentUploaded() when attachmentUploaded != null:
return attachmentUploaded(_that.arquivo);case TaskDetailAttachmentDeleted() when attachmentDeleted != null:
return attachmentDeleted(_that.attachmentId);case _:
  return null;

}
}

}

/// @nodoc


class TaskDetailLoaded implements TaskDetailEvent {
  const TaskDetailLoaded(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailLoadedCopyWith<TaskDetailLoaded> get copyWith => _$TaskDetailLoadedCopyWithImpl<TaskDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailLoaded&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskDetailEvent.loaded(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $TaskDetailLoadedCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailLoadedCopyWith(TaskDetailLoaded value, $Res Function(TaskDetailLoaded) _then) = _$TaskDetailLoadedCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$TaskDetailLoadedCopyWithImpl<$Res>
    implements $TaskDetailLoadedCopyWith<$Res> {
  _$TaskDetailLoadedCopyWithImpl(this._self, this._then);

  final TaskDetailLoaded _self;
  final $Res Function(TaskDetailLoaded) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(TaskDetailLoaded(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskDetailRefreshed implements TaskDetailEvent {
  const TaskDetailRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskDetailEvent.refreshed()';
}


}




/// @nodoc


class TaskDetailSubtaskAdded implements TaskDetailEvent {
  const TaskDetailSubtaskAdded(this.titulo);
  

 final  String titulo;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailSubtaskAddedCopyWith<TaskDetailSubtaskAdded> get copyWith => _$TaskDetailSubtaskAddedCopyWithImpl<TaskDetailSubtaskAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailSubtaskAdded&&(identical(other.titulo, titulo) || other.titulo == titulo));
}


@override
int get hashCode => Object.hash(runtimeType,titulo);

@override
String toString() {
  return 'TaskDetailEvent.subtaskAdded(titulo: $titulo)';
}


}

/// @nodoc
abstract mixin class $TaskDetailSubtaskAddedCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailSubtaskAddedCopyWith(TaskDetailSubtaskAdded value, $Res Function(TaskDetailSubtaskAdded) _then) = _$TaskDetailSubtaskAddedCopyWithImpl;
@useResult
$Res call({
 String titulo
});




}
/// @nodoc
class _$TaskDetailSubtaskAddedCopyWithImpl<$Res>
    implements $TaskDetailSubtaskAddedCopyWith<$Res> {
  _$TaskDetailSubtaskAddedCopyWithImpl(this._self, this._then);

  final TaskDetailSubtaskAdded _self;
  final $Res Function(TaskDetailSubtaskAdded) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? titulo = null,}) {
  return _then(TaskDetailSubtaskAdded(
null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskDetailSubtaskToggled implements TaskDetailEvent {
  const TaskDetailSubtaskToggled(this.subtaskId);
  

 final  String subtaskId;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailSubtaskToggledCopyWith<TaskDetailSubtaskToggled> get copyWith => _$TaskDetailSubtaskToggledCopyWithImpl<TaskDetailSubtaskToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailSubtaskToggled&&(identical(other.subtaskId, subtaskId) || other.subtaskId == subtaskId));
}


@override
int get hashCode => Object.hash(runtimeType,subtaskId);

@override
String toString() {
  return 'TaskDetailEvent.subtaskToggled(subtaskId: $subtaskId)';
}


}

/// @nodoc
abstract mixin class $TaskDetailSubtaskToggledCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailSubtaskToggledCopyWith(TaskDetailSubtaskToggled value, $Res Function(TaskDetailSubtaskToggled) _then) = _$TaskDetailSubtaskToggledCopyWithImpl;
@useResult
$Res call({
 String subtaskId
});




}
/// @nodoc
class _$TaskDetailSubtaskToggledCopyWithImpl<$Res>
    implements $TaskDetailSubtaskToggledCopyWith<$Res> {
  _$TaskDetailSubtaskToggledCopyWithImpl(this._self, this._then);

  final TaskDetailSubtaskToggled _self;
  final $Res Function(TaskDetailSubtaskToggled) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subtaskId = null,}) {
  return _then(TaskDetailSubtaskToggled(
null == subtaskId ? _self.subtaskId : subtaskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskDetailSubtaskDeleted implements TaskDetailEvent {
  const TaskDetailSubtaskDeleted(this.subtaskId);
  

 final  String subtaskId;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailSubtaskDeletedCopyWith<TaskDetailSubtaskDeleted> get copyWith => _$TaskDetailSubtaskDeletedCopyWithImpl<TaskDetailSubtaskDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailSubtaskDeleted&&(identical(other.subtaskId, subtaskId) || other.subtaskId == subtaskId));
}


@override
int get hashCode => Object.hash(runtimeType,subtaskId);

@override
String toString() {
  return 'TaskDetailEvent.subtaskDeleted(subtaskId: $subtaskId)';
}


}

/// @nodoc
abstract mixin class $TaskDetailSubtaskDeletedCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailSubtaskDeletedCopyWith(TaskDetailSubtaskDeleted value, $Res Function(TaskDetailSubtaskDeleted) _then) = _$TaskDetailSubtaskDeletedCopyWithImpl;
@useResult
$Res call({
 String subtaskId
});




}
/// @nodoc
class _$TaskDetailSubtaskDeletedCopyWithImpl<$Res>
    implements $TaskDetailSubtaskDeletedCopyWith<$Res> {
  _$TaskDetailSubtaskDeletedCopyWithImpl(this._self, this._then);

  final TaskDetailSubtaskDeleted _self;
  final $Res Function(TaskDetailSubtaskDeleted) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subtaskId = null,}) {
  return _then(TaskDetailSubtaskDeleted(
null == subtaskId ? _self.subtaskId : subtaskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskDetailAttachmentUploaded implements TaskDetailEvent {
  const TaskDetailAttachmentUploaded(this.arquivo);
  

 final  File arquivo;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailAttachmentUploadedCopyWith<TaskDetailAttachmentUploaded> get copyWith => _$TaskDetailAttachmentUploadedCopyWithImpl<TaskDetailAttachmentUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailAttachmentUploaded&&(identical(other.arquivo, arquivo) || other.arquivo == arquivo));
}


@override
int get hashCode => Object.hash(runtimeType,arquivo);

@override
String toString() {
  return 'TaskDetailEvent.attachmentUploaded(arquivo: $arquivo)';
}


}

/// @nodoc
abstract mixin class $TaskDetailAttachmentUploadedCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailAttachmentUploadedCopyWith(TaskDetailAttachmentUploaded value, $Res Function(TaskDetailAttachmentUploaded) _then) = _$TaskDetailAttachmentUploadedCopyWithImpl;
@useResult
$Res call({
 File arquivo
});




}
/// @nodoc
class _$TaskDetailAttachmentUploadedCopyWithImpl<$Res>
    implements $TaskDetailAttachmentUploadedCopyWith<$Res> {
  _$TaskDetailAttachmentUploadedCopyWithImpl(this._self, this._then);

  final TaskDetailAttachmentUploaded _self;
  final $Res Function(TaskDetailAttachmentUploaded) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? arquivo = null,}) {
  return _then(TaskDetailAttachmentUploaded(
null == arquivo ? _self.arquivo : arquivo // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class TaskDetailAttachmentDeleted implements TaskDetailEvent {
  const TaskDetailAttachmentDeleted(this.attachmentId);
  

 final  String attachmentId;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailAttachmentDeletedCopyWith<TaskDetailAttachmentDeleted> get copyWith => _$TaskDetailAttachmentDeletedCopyWithImpl<TaskDetailAttachmentDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailAttachmentDeleted&&(identical(other.attachmentId, attachmentId) || other.attachmentId == attachmentId));
}


@override
int get hashCode => Object.hash(runtimeType,attachmentId);

@override
String toString() {
  return 'TaskDetailEvent.attachmentDeleted(attachmentId: $attachmentId)';
}


}

/// @nodoc
abstract mixin class $TaskDetailAttachmentDeletedCopyWith<$Res> implements $TaskDetailEventCopyWith<$Res> {
  factory $TaskDetailAttachmentDeletedCopyWith(TaskDetailAttachmentDeleted value, $Res Function(TaskDetailAttachmentDeleted) _then) = _$TaskDetailAttachmentDeletedCopyWithImpl;
@useResult
$Res call({
 String attachmentId
});




}
/// @nodoc
class _$TaskDetailAttachmentDeletedCopyWithImpl<$Res>
    implements $TaskDetailAttachmentDeletedCopyWith<$Res> {
  _$TaskDetailAttachmentDeletedCopyWithImpl(this._self, this._then);

  final TaskDetailAttachmentDeleted _self;
  final $Res Function(TaskDetailAttachmentDeleted) _then;

/// Create a copy of TaskDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attachmentId = null,}) {
  return _then(TaskDetailAttachmentDeleted(
null == attachmentId ? _self.attachmentId : attachmentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
