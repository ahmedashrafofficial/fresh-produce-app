// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemRequestModel {

 String get productId; double get quantityKg;
/// Create a copy of OrderItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemRequestModelCopyWith<OrderItemRequestModel> get copyWith => _$OrderItemRequestModelCopyWithImpl<OrderItemRequestModel>(this as OrderItemRequestModel, _$identity);

  /// Serializes this OrderItemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantityKg, quantityKg) || other.quantityKg == quantityKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantityKg);

@override
String toString() {
  return 'OrderItemRequestModel(productId: $productId, quantityKg: $quantityKg)';
}


}

/// @nodoc
abstract mixin class $OrderItemRequestModelCopyWith<$Res>  {
  factory $OrderItemRequestModelCopyWith(OrderItemRequestModel value, $Res Function(OrderItemRequestModel) _then) = _$OrderItemRequestModelCopyWithImpl;
@useResult
$Res call({
 String productId, double quantityKg
});




}
/// @nodoc
class _$OrderItemRequestModelCopyWithImpl<$Res>
    implements $OrderItemRequestModelCopyWith<$Res> {
  _$OrderItemRequestModelCopyWithImpl(this._self, this._then);

  final OrderItemRequestModel _self;
  final $Res Function(OrderItemRequestModel) _then;

/// Create a copy of OrderItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantityKg = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,quantityKg: null == quantityKg ? _self.quantityKg : quantityKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemRequestModel].
extension OrderItemRequestModelPatterns on OrderItemRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  double quantityKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemRequestModel() when $default != null:
return $default(_that.productId,_that.quantityKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  double quantityKg)  $default,) {final _that = this;
switch (_that) {
case _OrderItemRequestModel():
return $default(_that.productId,_that.quantityKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  double quantityKg)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemRequestModel() when $default != null:
return $default(_that.productId,_that.quantityKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemRequestModel implements OrderItemRequestModel {
  const _OrderItemRequestModel({required this.productId, required this.quantityKg});
  factory _OrderItemRequestModel.fromJson(Map<String, dynamic> json) => _$OrderItemRequestModelFromJson(json);

@override final  String productId;
@override final  double quantityKg;

/// Create a copy of OrderItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemRequestModelCopyWith<_OrderItemRequestModel> get copyWith => __$OrderItemRequestModelCopyWithImpl<_OrderItemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemRequestModel&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantityKg, quantityKg) || other.quantityKg == quantityKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantityKg);

@override
String toString() {
  return 'OrderItemRequestModel(productId: $productId, quantityKg: $quantityKg)';
}


}

/// @nodoc
abstract mixin class _$OrderItemRequestModelCopyWith<$Res> implements $OrderItemRequestModelCopyWith<$Res> {
  factory _$OrderItemRequestModelCopyWith(_OrderItemRequestModel value, $Res Function(_OrderItemRequestModel) _then) = __$OrderItemRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String productId, double quantityKg
});




}
/// @nodoc
class __$OrderItemRequestModelCopyWithImpl<$Res>
    implements _$OrderItemRequestModelCopyWith<$Res> {
  __$OrderItemRequestModelCopyWithImpl(this._self, this._then);

  final _OrderItemRequestModel _self;
  final $Res Function(_OrderItemRequestModel) _then;

/// Create a copy of OrderItemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantityKg = null,}) {
  return _then(_OrderItemRequestModel(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,quantityKg: null == quantityKg ? _self.quantityKg : quantityKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PlaceOrderRequestModel {

 String get roundId; List<OrderItemRequestModel> get items; int get deliveryType; String? get deliveryAddress; String? get deliveryPhone;
/// Create a copy of PlaceOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderRequestModelCopyWith<PlaceOrderRequestModel> get copyWith => _$PlaceOrderRequestModelCopyWithImpl<PlaceOrderRequestModel>(this as PlaceOrderRequestModel, _$identity);

  /// Serializes this PlaceOrderRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderRequestModel&&(identical(other.roundId, roundId) || other.roundId == roundId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryPhone, deliveryPhone) || other.deliveryPhone == deliveryPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roundId,const DeepCollectionEquality().hash(items),deliveryType,deliveryAddress,deliveryPhone);

@override
String toString() {
  return 'PlaceOrderRequestModel(roundId: $roundId, items: $items, deliveryType: $deliveryType, deliveryAddress: $deliveryAddress, deliveryPhone: $deliveryPhone)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderRequestModelCopyWith<$Res>  {
  factory $PlaceOrderRequestModelCopyWith(PlaceOrderRequestModel value, $Res Function(PlaceOrderRequestModel) _then) = _$PlaceOrderRequestModelCopyWithImpl;
@useResult
$Res call({
 String roundId, List<OrderItemRequestModel> items, int deliveryType, String? deliveryAddress, String? deliveryPhone
});




}
/// @nodoc
class _$PlaceOrderRequestModelCopyWithImpl<$Res>
    implements $PlaceOrderRequestModelCopyWith<$Res> {
  _$PlaceOrderRequestModelCopyWithImpl(this._self, this._then);

  final PlaceOrderRequestModel _self;
  final $Res Function(PlaceOrderRequestModel) _then;

/// Create a copy of PlaceOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roundId = null,Object? items = null,Object? deliveryType = null,Object? deliveryAddress = freezed,Object? deliveryPhone = freezed,}) {
  return _then(_self.copyWith(
roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequestModel>,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as int,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryPhone: freezed == deliveryPhone ? _self.deliveryPhone : deliveryPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceOrderRequestModel].
extension PlaceOrderRequestModelPatterns on PlaceOrderRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roundId,  List<OrderItemRequestModel> items,  int deliveryType,  String? deliveryAddress,  String? deliveryPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderRequestModel() when $default != null:
return $default(_that.roundId,_that.items,_that.deliveryType,_that.deliveryAddress,_that.deliveryPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roundId,  List<OrderItemRequestModel> items,  int deliveryType,  String? deliveryAddress,  String? deliveryPhone)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequestModel():
return $default(_that.roundId,_that.items,_that.deliveryType,_that.deliveryAddress,_that.deliveryPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roundId,  List<OrderItemRequestModel> items,  int deliveryType,  String? deliveryAddress,  String? deliveryPhone)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequestModel() when $default != null:
return $default(_that.roundId,_that.items,_that.deliveryType,_that.deliveryAddress,_that.deliveryPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceOrderRequestModel implements PlaceOrderRequestModel {
  const _PlaceOrderRequestModel({required this.roundId, required final  List<OrderItemRequestModel> items, required this.deliveryType, this.deliveryAddress, this.deliveryPhone}): _items = items;
  factory _PlaceOrderRequestModel.fromJson(Map<String, dynamic> json) => _$PlaceOrderRequestModelFromJson(json);

@override final  String roundId;
 final  List<OrderItemRequestModel> _items;
@override List<OrderItemRequestModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int deliveryType;
@override final  String? deliveryAddress;
@override final  String? deliveryPhone;

/// Create a copy of PlaceOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderRequestModelCopyWith<_PlaceOrderRequestModel> get copyWith => __$PlaceOrderRequestModelCopyWithImpl<_PlaceOrderRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceOrderRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderRequestModel&&(identical(other.roundId, roundId) || other.roundId == roundId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryPhone, deliveryPhone) || other.deliveryPhone == deliveryPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roundId,const DeepCollectionEquality().hash(_items),deliveryType,deliveryAddress,deliveryPhone);

@override
String toString() {
  return 'PlaceOrderRequestModel(roundId: $roundId, items: $items, deliveryType: $deliveryType, deliveryAddress: $deliveryAddress, deliveryPhone: $deliveryPhone)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderRequestModelCopyWith<$Res> implements $PlaceOrderRequestModelCopyWith<$Res> {
  factory _$PlaceOrderRequestModelCopyWith(_PlaceOrderRequestModel value, $Res Function(_PlaceOrderRequestModel) _then) = __$PlaceOrderRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String roundId, List<OrderItemRequestModel> items, int deliveryType, String? deliveryAddress, String? deliveryPhone
});




}
/// @nodoc
class __$PlaceOrderRequestModelCopyWithImpl<$Res>
    implements _$PlaceOrderRequestModelCopyWith<$Res> {
  __$PlaceOrderRequestModelCopyWithImpl(this._self, this._then);

  final _PlaceOrderRequestModel _self;
  final $Res Function(_PlaceOrderRequestModel) _then;

/// Create a copy of PlaceOrderRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roundId = null,Object? items = null,Object? deliveryType = null,Object? deliveryAddress = freezed,Object? deliveryPhone = freezed,}) {
  return _then(_PlaceOrderRequestModel(
roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequestModel>,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as int,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryPhone: freezed == deliveryPhone ? _self.deliveryPhone : deliveryPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
