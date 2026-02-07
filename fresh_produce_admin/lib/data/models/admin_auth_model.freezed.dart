// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminAuthModel {

 String get token; String get refreshToken;
/// Create a copy of AdminAuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminAuthModelCopyWith<AdminAuthModel> get copyWith => _$AdminAuthModelCopyWithImpl<AdminAuthModel>(this as AdminAuthModel, _$identity);

  /// Serializes this AdminAuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminAuthModel&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,refreshToken);

@override
String toString() {
  return 'AdminAuthModel(token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AdminAuthModelCopyWith<$Res>  {
  factory $AdminAuthModelCopyWith(AdminAuthModel value, $Res Function(AdminAuthModel) _then) = _$AdminAuthModelCopyWithImpl;
@useResult
$Res call({
 String token, String refreshToken
});




}
/// @nodoc
class _$AdminAuthModelCopyWithImpl<$Res>
    implements $AdminAuthModelCopyWith<$Res> {
  _$AdminAuthModelCopyWithImpl(this._self, this._then);

  final AdminAuthModel _self;
  final $Res Function(AdminAuthModel) _then;

/// Create a copy of AdminAuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminAuthModel].
extension AdminAuthModelPatterns on AdminAuthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminAuthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminAuthModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminAuthModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminAuthModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminAuthModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminAuthModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminAuthModel() when $default != null:
return $default(_that.token,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AdminAuthModel():
return $default(_that.token,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AdminAuthModel() when $default != null:
return $default(_that.token,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminAuthModel implements AdminAuthModel {
  const _AdminAuthModel({required this.token, required this.refreshToken});
  factory _AdminAuthModel.fromJson(Map<String, dynamic> json) => _$AdminAuthModelFromJson(json);

@override final  String token;
@override final  String refreshToken;

/// Create a copy of AdminAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminAuthModelCopyWith<_AdminAuthModel> get copyWith => __$AdminAuthModelCopyWithImpl<_AdminAuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminAuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminAuthModel&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,refreshToken);

@override
String toString() {
  return 'AdminAuthModel(token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AdminAuthModelCopyWith<$Res> implements $AdminAuthModelCopyWith<$Res> {
  factory _$AdminAuthModelCopyWith(_AdminAuthModel value, $Res Function(_AdminAuthModel) _then) = __$AdminAuthModelCopyWithImpl;
@override @useResult
$Res call({
 String token, String refreshToken
});




}
/// @nodoc
class __$AdminAuthModelCopyWithImpl<$Res>
    implements _$AdminAuthModelCopyWith<$Res> {
  __$AdminAuthModelCopyWithImpl(this._self, this._then);

  final _AdminAuthModel _self;
  final $Res Function(_AdminAuthModel) _then;

/// Create a copy of AdminAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? refreshToken = null,}) {
  return _then(_AdminAuthModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
