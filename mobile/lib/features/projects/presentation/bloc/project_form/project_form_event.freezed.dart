// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectFormEvent {

 Project? get initial; String get nome; String get cor; String? get categoriaId;
/// Create a copy of ProjectFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFormEventCopyWith<ProjectFormEvent> get copyWith => _$ProjectFormEventCopyWithImpl<ProjectFormEvent>(this as ProjectFormEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormEvent&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.cor, cor) || other.cor == cor)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId));
}


@override
int get hashCode => Object.hash(runtimeType,initial,nome,cor,categoriaId);

@override
String toString() {
  return 'ProjectFormEvent(initial: $initial, nome: $nome, cor: $cor, categoriaId: $categoriaId)';
}


}

/// @nodoc
abstract mixin class $ProjectFormEventCopyWith<$Res>  {
  factory $ProjectFormEventCopyWith(ProjectFormEvent value, $Res Function(ProjectFormEvent) _then) = _$ProjectFormEventCopyWithImpl;
@useResult
$Res call({
 Project? initial, String nome, String cor, String? categoriaId
});




}
/// @nodoc
class _$ProjectFormEventCopyWithImpl<$Res>
    implements $ProjectFormEventCopyWith<$Res> {
  _$ProjectFormEventCopyWithImpl(this._self, this._then);

  final ProjectFormEvent _self;
  final $Res Function(ProjectFormEvent) _then;

/// Create a copy of ProjectFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initial = freezed,Object? nome = null,Object? cor = null,Object? categoriaId = freezed,}) {
  return _then(_self.copyWith(
initial: freezed == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as Project?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,cor: null == cor ? _self.cor : cor // ignore: cast_nullable_to_non_nullable
as String,categoriaId: freezed == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectFormEvent].
extension ProjectFormEventPatterns on ProjectFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectFormSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectFormSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectFormSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case ProjectFormSubmitted():
return submitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectFormSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case ProjectFormSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Project? initial,  String nome,  String cor,  String? categoriaId)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectFormSubmitted() when submitted != null:
return submitted(_that.initial,_that.nome,_that.cor,_that.categoriaId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Project? initial,  String nome,  String cor,  String? categoriaId)  submitted,}) {final _that = this;
switch (_that) {
case ProjectFormSubmitted():
return submitted(_that.initial,_that.nome,_that.cor,_that.categoriaId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Project? initial,  String nome,  String cor,  String? categoriaId)?  submitted,}) {final _that = this;
switch (_that) {
case ProjectFormSubmitted() when submitted != null:
return submitted(_that.initial,_that.nome,_that.cor,_that.categoriaId);case _:
  return null;

}
}

}

/// @nodoc


class ProjectFormSubmitted implements ProjectFormEvent {
  const ProjectFormSubmitted({this.initial, required this.nome, required this.cor, this.categoriaId});
  

@override final  Project? initial;
@override final  String nome;
@override final  String cor;
@override final  String? categoriaId;

/// Create a copy of ProjectFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFormSubmittedCopyWith<ProjectFormSubmitted> get copyWith => _$ProjectFormSubmittedCopyWithImpl<ProjectFormSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFormSubmitted&&(identical(other.initial, initial) || other.initial == initial)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.cor, cor) || other.cor == cor)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId));
}


@override
int get hashCode => Object.hash(runtimeType,initial,nome,cor,categoriaId);

@override
String toString() {
  return 'ProjectFormEvent.submitted(initial: $initial, nome: $nome, cor: $cor, categoriaId: $categoriaId)';
}


}

/// @nodoc
abstract mixin class $ProjectFormSubmittedCopyWith<$Res> implements $ProjectFormEventCopyWith<$Res> {
  factory $ProjectFormSubmittedCopyWith(ProjectFormSubmitted value, $Res Function(ProjectFormSubmitted) _then) = _$ProjectFormSubmittedCopyWithImpl;
@override @useResult
$Res call({
 Project? initial, String nome, String cor, String? categoriaId
});




}
/// @nodoc
class _$ProjectFormSubmittedCopyWithImpl<$Res>
    implements $ProjectFormSubmittedCopyWith<$Res> {
  _$ProjectFormSubmittedCopyWithImpl(this._self, this._then);

  final ProjectFormSubmitted _self;
  final $Res Function(ProjectFormSubmitted) _then;

/// Create a copy of ProjectFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initial = freezed,Object? nome = null,Object? cor = null,Object? categoriaId = freezed,}) {
  return _then(ProjectFormSubmitted(
initial: freezed == initial ? _self.initial : initial // ignore: cast_nullable_to_non_nullable
as Project?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,cor: null == cor ? _self.cor : cor // ignore: cast_nullable_to_non_nullable
as String,categoriaId: freezed == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
