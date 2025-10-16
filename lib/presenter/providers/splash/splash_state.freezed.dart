// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashInitial value)?  initial,TResult Function( SplashLoading value)?  loading,TResult Function( SplashLoaded value)?  loaded,TResult Function( SplashError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial(_that);case SplashLoading() when loading != null:
return loading(_that);case SplashLoaded() when loaded != null:
return loaded(_that);case SplashError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashInitial value)  initial,required TResult Function( SplashLoading value)  loading,required TResult Function( SplashLoaded value)  loaded,required TResult Function( SplashError value)  error,}){
final _that = this;
switch (_that) {
case SplashInitial():
return initial(_that);case SplashLoading():
return loading(_that);case SplashLoaded():
return loaded(_that);case SplashError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashInitial value)?  initial,TResult? Function( SplashLoading value)?  loading,TResult? Function( SplashLoaded value)?  loaded,TResult? Function( SplashError value)?  error,}){
final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial(_that);case SplashLoading() when loading != null:
return loading(_that);case SplashLoaded() when loaded != null:
return loaded(_that);case SplashError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductEntity> products)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial();case SplashLoading() when loading != null:
return loading();case SplashLoaded() when loaded != null:
return loaded(_that.products);case SplashError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductEntity> products)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SplashInitial():
return initial();case SplashLoading():
return loading();case SplashLoaded():
return loaded(_that.products);case SplashError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductEntity> products)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SplashInitial() when initial != null:
return initial();case SplashLoading() when loading != null:
return loading();case SplashLoaded() when loaded != null:
return loaded(_that.products);case SplashError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SplashInitial implements SplashState {
  const SplashInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class SplashLoading implements SplashState {
  const SplashLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.loading()';
}


}




/// @nodoc


class SplashLoaded implements SplashState {
  const SplashLoaded({required final  List<ProductEntity> products}): _products = products;
  

 final  List<ProductEntity> _products;
 List<ProductEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashLoadedCopyWith<SplashLoaded> get copyWith => _$SplashLoadedCopyWithImpl<SplashLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashLoaded&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'SplashState.loaded(products: $products)';
}


}

/// @nodoc
abstract mixin class $SplashLoadedCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $SplashLoadedCopyWith(SplashLoaded value, $Res Function(SplashLoaded) _then) = _$SplashLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> products
});




}
/// @nodoc
class _$SplashLoadedCopyWithImpl<$Res>
    implements $SplashLoadedCopyWith<$Res> {
  _$SplashLoadedCopyWithImpl(this._self, this._then);

  final SplashLoaded _self;
  final $Res Function(SplashLoaded) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(SplashLoaded(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}


}

/// @nodoc


class SplashError implements SplashState {
  const SplashError({required this.message});
  

 final  String message;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashErrorCopyWith<SplashError> get copyWith => _$SplashErrorCopyWithImpl<SplashError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SplashErrorCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $SplashErrorCopyWith(SplashError value, $Res Function(SplashError) _then) = _$SplashErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SplashErrorCopyWithImpl<$Res>
    implements $SplashErrorCopyWith<$Res> {
  _$SplashErrorCopyWithImpl(this._self, this._then);

  final SplashError _self;
  final $Res Function(SplashError) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SplashError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
