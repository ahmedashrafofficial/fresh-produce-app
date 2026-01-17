// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'neighborhood_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NeighborhoodModel {

 String get id; String get name; String get city; double get deliveryFee; String? get pickupPointAddress; String? get pickupPointNotes;
/// Create a copy of NeighborhoodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeighborhoodModelCopyWith<NeighborhoodModel> get copyWith => _$NeighborhoodModelCopyWithImpl<NeighborhoodModel>(this as NeighborhoodModel, _$identity);

  /// Serializes this NeighborhoodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NeighborhoodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.pickupPointAddress, pickupPointAddress) || other.pickupPointAddress == pickupPointAddress)&&(identical(other.pickupPointNotes, pickupPointNotes) || other.pickupPointNotes == pickupPointNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city,deliveryFee,pickupPointAddress,pickupPointNotes);

@override
String toString() {
  return 'NeighborhoodModel(id: $id, name: $name, city: $city, deliveryFee: $deliveryFee, pickupPointAddress: $pickupPointAddress, pickupPointNotes: $pickupPointNotes)';
}


}

/// @nodoc
abstract mixin class $NeighborhoodModelCopyWith<$Res>  {
  factory $NeighborhoodModelCopyWith(NeighborhoodModel value, $Res Function(NeighborhoodModel) _then) = _$NeighborhoodModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String city, double deliveryFee, String? pickupPointAddress, String? pickupPointNotes
});




}
/// @nodoc
class _$NeighborhoodModelCopyWithImpl<$Res>
    implements $NeighborhoodModelCopyWith<$Res> {
  _$NeighborhoodModelCopyWithImpl(this._self, this._then);

  final NeighborhoodModel _self;
  final $Res Function(NeighborhoodModel) _then;

/// Create a copy of NeighborhoodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? city = null,Object? deliveryFee = null,Object? pickupPointAddress = freezed,Object? pickupPointNotes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,pickupPointAddress: freezed == pickupPointAddress ? _self.pickupPointAddress : pickupPointAddress // ignore: cast_nullable_to_non_nullable
as String?,pickupPointNotes: freezed == pickupPointNotes ? _self.pickupPointNotes : pickupPointNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NeighborhoodModel].
extension NeighborhoodModelPatterns on NeighborhoodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NeighborhoodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NeighborhoodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NeighborhoodModel value)  $default,){
final _that = this;
switch (_that) {
case _NeighborhoodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NeighborhoodModel value)?  $default,){
final _that = this;
switch (_that) {
case _NeighborhoodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String city,  double deliveryFee,  String? pickupPointAddress,  String? pickupPointNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NeighborhoodModel() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.deliveryFee,_that.pickupPointAddress,_that.pickupPointNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String city,  double deliveryFee,  String? pickupPointAddress,  String? pickupPointNotes)  $default,) {final _that = this;
switch (_that) {
case _NeighborhoodModel():
return $default(_that.id,_that.name,_that.city,_that.deliveryFee,_that.pickupPointAddress,_that.pickupPointNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String city,  double deliveryFee,  String? pickupPointAddress,  String? pickupPointNotes)?  $default,) {final _that = this;
switch (_that) {
case _NeighborhoodModel() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.deliveryFee,_that.pickupPointAddress,_that.pickupPointNotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NeighborhoodModel implements NeighborhoodModel {
  const _NeighborhoodModel({required this.id, required this.name, required this.city, this.deliveryFee = 20.0, this.pickupPointAddress, this.pickupPointNotes});
  factory _NeighborhoodModel.fromJson(Map<String, dynamic> json) => _$NeighborhoodModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String city;
@override@JsonKey() final  double deliveryFee;
@override final  String? pickupPointAddress;
@override final  String? pickupPointNotes;

/// Create a copy of NeighborhoodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NeighborhoodModelCopyWith<_NeighborhoodModel> get copyWith => __$NeighborhoodModelCopyWithImpl<_NeighborhoodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NeighborhoodModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NeighborhoodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.pickupPointAddress, pickupPointAddress) || other.pickupPointAddress == pickupPointAddress)&&(identical(other.pickupPointNotes, pickupPointNotes) || other.pickupPointNotes == pickupPointNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city,deliveryFee,pickupPointAddress,pickupPointNotes);

@override
String toString() {
  return 'NeighborhoodModel(id: $id, name: $name, city: $city, deliveryFee: $deliveryFee, pickupPointAddress: $pickupPointAddress, pickupPointNotes: $pickupPointNotes)';
}


}

/// @nodoc
abstract mixin class _$NeighborhoodModelCopyWith<$Res> implements $NeighborhoodModelCopyWith<$Res> {
  factory _$NeighborhoodModelCopyWith(_NeighborhoodModel value, $Res Function(_NeighborhoodModel) _then) = __$NeighborhoodModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String city, double deliveryFee, String? pickupPointAddress, String? pickupPointNotes
});




}
/// @nodoc
class __$NeighborhoodModelCopyWithImpl<$Res>
    implements _$NeighborhoodModelCopyWith<$Res> {
  __$NeighborhoodModelCopyWithImpl(this._self, this._then);

  final _NeighborhoodModel _self;
  final $Res Function(_NeighborhoodModel) _then;

/// Create a copy of NeighborhoodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? city = null,Object? deliveryFee = null,Object? pickupPointAddress = freezed,Object? pickupPointNotes = freezed,}) {
  return _then(_NeighborhoodModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,pickupPointAddress: freezed == pickupPointAddress ? _self.pickupPointAddress : pickupPointAddress // ignore: cast_nullable_to_non_nullable
as String?,pickupPointNotes: freezed == pickupPointNotes ? _self.pickupPointNotes : pickupPointNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
