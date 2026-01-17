// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {

 String get id; String get productId; ProductModel? get product; double get quantityKg; double get estimatedPricePerKg; double? get finalPricePerKg;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantityKg, quantityKg) || other.quantityKg == quantityKg)&&(identical(other.estimatedPricePerKg, estimatedPricePerKg) || other.estimatedPricePerKg == estimatedPricePerKg)&&(identical(other.finalPricePerKg, finalPricePerKg) || other.finalPricePerKg == finalPricePerKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,product,quantityKg,estimatedPricePerKg,finalPricePerKg);

@override
String toString() {
  return 'OrderItemModel(id: $id, productId: $productId, product: $product, quantityKg: $quantityKg, estimatedPricePerKg: $estimatedPricePerKg, finalPricePerKg: $finalPricePerKg)';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String productId, ProductModel? product, double quantityKg, double estimatedPricePerKg, double? finalPricePerKg
});


$ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? product = freezed,Object? quantityKg = null,Object? estimatedPricePerKg = null,Object? finalPricePerKg = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,quantityKg: null == quantityKg ? _self.quantityKg : quantityKg // ignore: cast_nullable_to_non_nullable
as double,estimatedPricePerKg: null == estimatedPricePerKg ? _self.estimatedPricePerKg : estimatedPricePerKg // ignore: cast_nullable_to_non_nullable
as double,finalPricePerKg: freezed == finalPricePerKg ? _self.finalPricePerKg : finalPricePerKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  ProductModel? product,  double quantityKg,  double estimatedPricePerKg,  double? finalPricePerKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.productId,_that.product,_that.quantityKg,_that.estimatedPricePerKg,_that.finalPricePerKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  ProductModel? product,  double quantityKg,  double estimatedPricePerKg,  double? finalPricePerKg)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.id,_that.productId,_that.product,_that.quantityKg,_that.estimatedPricePerKg,_that.finalPricePerKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  ProductModel? product,  double quantityKg,  double estimatedPricePerKg,  double? finalPricePerKg)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.productId,_that.product,_that.quantityKg,_that.estimatedPricePerKg,_that.finalPricePerKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel({required this.id, required this.productId, this.product, required this.quantityKg, required this.estimatedPricePerKg, this.finalPricePerKg});
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  String id;
@override final  String productId;
@override final  ProductModel? product;
@override final  double quantityKg;
@override final  double estimatedPricePerKg;
@override final  double? finalPricePerKg;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantityKg, quantityKg) || other.quantityKg == quantityKg)&&(identical(other.estimatedPricePerKg, estimatedPricePerKg) || other.estimatedPricePerKg == estimatedPricePerKg)&&(identical(other.finalPricePerKg, finalPricePerKg) || other.finalPricePerKg == finalPricePerKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,product,quantityKg,estimatedPricePerKg,finalPricePerKg);

@override
String toString() {
  return 'OrderItemModel(id: $id, productId: $productId, product: $product, quantityKg: $quantityKg, estimatedPricePerKg: $estimatedPricePerKg, finalPricePerKg: $finalPricePerKg)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, ProductModel? product, double quantityKg, double estimatedPricePerKg, double? finalPricePerKg
});


@override $ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? product = freezed,Object? quantityKg = null,Object? estimatedPricePerKg = null,Object? finalPricePerKg = freezed,}) {
  return _then(_OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,quantityKg: null == quantityKg ? _self.quantityKg : quantityKg // ignore: cast_nullable_to_non_nullable
as double,estimatedPricePerKg: null == estimatedPricePerKg ? _self.estimatedPricePerKg : estimatedPricePerKg // ignore: cast_nullable_to_non_nullable
as double,finalPricePerKg: freezed == finalPricePerKg ? _self.finalPricePerKg : finalPricePerKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$OrderModel {

 String get id; int get orderNumber; String get userId; String? get userName; String get roundId; int get status; DateTime get orderDate; int get deliveryType; double get deliveryFee; double get totalEstimatedAmount; double get prepaymentAmount; double? get finalAmount; List<OrderItemModel> get items;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.roundId, roundId) || other.roundId == roundId)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.totalEstimatedAmount, totalEstimatedAmount) || other.totalEstimatedAmount == totalEstimatedAmount)&&(identical(other.prepaymentAmount, prepaymentAmount) || other.prepaymentAmount == prepaymentAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,userId,userName,roundId,status,orderDate,deliveryType,deliveryFee,totalEstimatedAmount,prepaymentAmount,finalAmount,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'OrderModel(id: $id, orderNumber: $orderNumber, userId: $userId, userName: $userName, roundId: $roundId, status: $status, orderDate: $orderDate, deliveryType: $deliveryType, deliveryFee: $deliveryFee, totalEstimatedAmount: $totalEstimatedAmount, prepaymentAmount: $prepaymentAmount, finalAmount: $finalAmount, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id, int orderNumber, String userId, String? userName, String roundId, int status, DateTime orderDate, int deliveryType, double deliveryFee, double totalEstimatedAmount, double prepaymentAmount, double? finalAmount, List<OrderItemModel> items
});




}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? userId = null,Object? userName = freezed,Object? roundId = null,Object? status = null,Object? orderDate = null,Object? deliveryType = null,Object? deliveryFee = null,Object? totalEstimatedAmount = null,Object? prepaymentAmount = null,Object? finalAmount = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as DateTime,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,totalEstimatedAmount: null == totalEstimatedAmount ? _self.totalEstimatedAmount : totalEstimatedAmount // ignore: cast_nullable_to_non_nullable
as double,prepaymentAmount: null == prepaymentAmount ? _self.prepaymentAmount : prepaymentAmount // ignore: cast_nullable_to_non_nullable
as double,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int orderNumber,  String userId,  String? userName,  String roundId,  int status,  DateTime orderDate,  int deliveryType,  double deliveryFee,  double totalEstimatedAmount,  double prepaymentAmount,  double? finalAmount,  List<OrderItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.userId,_that.userName,_that.roundId,_that.status,_that.orderDate,_that.deliveryType,_that.deliveryFee,_that.totalEstimatedAmount,_that.prepaymentAmount,_that.finalAmount,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int orderNumber,  String userId,  String? userName,  String roundId,  int status,  DateTime orderDate,  int deliveryType,  double deliveryFee,  double totalEstimatedAmount,  double prepaymentAmount,  double? finalAmount,  List<OrderItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.orderNumber,_that.userId,_that.userName,_that.roundId,_that.status,_that.orderDate,_that.deliveryType,_that.deliveryFee,_that.totalEstimatedAmount,_that.prepaymentAmount,_that.finalAmount,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int orderNumber,  String userId,  String? userName,  String roundId,  int status,  DateTime orderDate,  int deliveryType,  double deliveryFee,  double totalEstimatedAmount,  double prepaymentAmount,  double? finalAmount,  List<OrderItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.userId,_that.userName,_that.roundId,_that.status,_that.orderDate,_that.deliveryType,_that.deliveryFee,_that.totalEstimatedAmount,_that.prepaymentAmount,_that.finalAmount,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, this.orderNumber = 0, required this.userId, this.userName, required this.roundId, required this.status, required this.orderDate, required this.deliveryType, required this.deliveryFee, required this.totalEstimatedAmount, required this.prepaymentAmount, this.finalAmount, final  List<OrderItemModel> items = const []}): _items = items;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String id;
@override@JsonKey() final  int orderNumber;
@override final  String userId;
@override final  String? userName;
@override final  String roundId;
@override final  int status;
@override final  DateTime orderDate;
@override final  int deliveryType;
@override final  double deliveryFee;
@override final  double totalEstimatedAmount;
@override final  double prepaymentAmount;
@override final  double? finalAmount;
 final  List<OrderItemModel> _items;
@override@JsonKey() List<OrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.roundId, roundId) || other.roundId == roundId)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.totalEstimatedAmount, totalEstimatedAmount) || other.totalEstimatedAmount == totalEstimatedAmount)&&(identical(other.prepaymentAmount, prepaymentAmount) || other.prepaymentAmount == prepaymentAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,userId,userName,roundId,status,orderDate,deliveryType,deliveryFee,totalEstimatedAmount,prepaymentAmount,finalAmount,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'OrderModel(id: $id, orderNumber: $orderNumber, userId: $userId, userName: $userName, roundId: $roundId, status: $status, orderDate: $orderDate, deliveryType: $deliveryType, deliveryFee: $deliveryFee, totalEstimatedAmount: $totalEstimatedAmount, prepaymentAmount: $prepaymentAmount, finalAmount: $finalAmount, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int orderNumber, String userId, String? userName, String roundId, int status, DateTime orderDate, int deliveryType, double deliveryFee, double totalEstimatedAmount, double prepaymentAmount, double? finalAmount, List<OrderItemModel> items
});




}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? userId = null,Object? userName = freezed,Object? roundId = null,Object? status = null,Object? orderDate = null,Object? deliveryType = null,Object? deliveryFee = null,Object? totalEstimatedAmount = null,Object? prepaymentAmount = null,Object? finalAmount = freezed,Object? items = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as DateTime,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,totalEstimatedAmount: null == totalEstimatedAmount ? _self.totalEstimatedAmount : totalEstimatedAmount // ignore: cast_nullable_to_non_nullable
as double,prepaymentAmount: null == prepaymentAmount ? _self.prepaymentAmount : prepaymentAmount // ignore: cast_nullable_to_non_nullable
as double,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}


}

// dart format on
