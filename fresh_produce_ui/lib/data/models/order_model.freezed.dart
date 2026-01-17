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

 String get id; int? get orderNumber; String get userId; String get roundId; RoundModel? get round; int get status; DateTime get orderDate; bool get isConfirmed; double get totalEstimatedAmount; double get prepaymentAmount; double? get finalAmount; double get amountPaid; int get deliveryType; double get deliveryFee; List<OrderItemModel> get items; List<PaymentModel> get payments;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.roundId, roundId) || other.roundId == roundId)&&(identical(other.round, round) || other.round == round)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.totalEstimatedAmount, totalEstimatedAmount) || other.totalEstimatedAmount == totalEstimatedAmount)&&(identical(other.prepaymentAmount, prepaymentAmount) || other.prepaymentAmount == prepaymentAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.payments, payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,userId,roundId,round,status,orderDate,isConfirmed,totalEstimatedAmount,prepaymentAmount,finalAmount,amountPaid,deliveryType,deliveryFee,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'OrderModel(id: $id, orderNumber: $orderNumber, userId: $userId, roundId: $roundId, round: $round, status: $status, orderDate: $orderDate, isConfirmed: $isConfirmed, totalEstimatedAmount: $totalEstimatedAmount, prepaymentAmount: $prepaymentAmount, finalAmount: $finalAmount, amountPaid: $amountPaid, deliveryType: $deliveryType, deliveryFee: $deliveryFee, items: $items, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id, int? orderNumber, String userId, String roundId, RoundModel? round, int status, DateTime orderDate, bool isConfirmed, double totalEstimatedAmount, double prepaymentAmount, double? finalAmount, double amountPaid, int deliveryType, double deliveryFee, List<OrderItemModel> items, List<PaymentModel> payments
});


$RoundModelCopyWith<$Res>? get round;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = freezed,Object? userId = null,Object? roundId = null,Object? round = freezed,Object? status = null,Object? orderDate = null,Object? isConfirmed = null,Object? totalEstimatedAmount = null,Object? prepaymentAmount = null,Object? finalAmount = freezed,Object? amountPaid = null,Object? deliveryType = null,Object? deliveryFee = null,Object? items = null,Object? payments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as int?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as RoundModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as DateTime,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,totalEstimatedAmount: null == totalEstimatedAmount ? _self.totalEstimatedAmount : totalEstimatedAmount // ignore: cast_nullable_to_non_nullable
as double,prepaymentAmount: null == prepaymentAmount ? _self.prepaymentAmount : prepaymentAmount // ignore: cast_nullable_to_non_nullable
as double,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double?,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundModelCopyWith<$Res>? get round {
    if (_self.round == null) {
    return null;
  }

  return $RoundModelCopyWith<$Res>(_self.round!, (value) {
    return _then(_self.copyWith(round: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int? orderNumber,  String userId,  String roundId,  RoundModel? round,  int status,  DateTime orderDate,  bool isConfirmed,  double totalEstimatedAmount,  double prepaymentAmount,  double? finalAmount,  double amountPaid,  int deliveryType,  double deliveryFee,  List<OrderItemModel> items,  List<PaymentModel> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.userId,_that.roundId,_that.round,_that.status,_that.orderDate,_that.isConfirmed,_that.totalEstimatedAmount,_that.prepaymentAmount,_that.finalAmount,_that.amountPaid,_that.deliveryType,_that.deliveryFee,_that.items,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int? orderNumber,  String userId,  String roundId,  RoundModel? round,  int status,  DateTime orderDate,  bool isConfirmed,  double totalEstimatedAmount,  double prepaymentAmount,  double? finalAmount,  double amountPaid,  int deliveryType,  double deliveryFee,  List<OrderItemModel> items,  List<PaymentModel> payments)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.orderNumber,_that.userId,_that.roundId,_that.round,_that.status,_that.orderDate,_that.isConfirmed,_that.totalEstimatedAmount,_that.prepaymentAmount,_that.finalAmount,_that.amountPaid,_that.deliveryType,_that.deliveryFee,_that.items,_that.payments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int? orderNumber,  String userId,  String roundId,  RoundModel? round,  int status,  DateTime orderDate,  bool isConfirmed,  double totalEstimatedAmount,  double prepaymentAmount,  double? finalAmount,  double amountPaid,  int deliveryType,  double deliveryFee,  List<OrderItemModel> items,  List<PaymentModel> payments)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.userId,_that.roundId,_that.round,_that.status,_that.orderDate,_that.isConfirmed,_that.totalEstimatedAmount,_that.prepaymentAmount,_that.finalAmount,_that.amountPaid,_that.deliveryType,_that.deliveryFee,_that.items,_that.payments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, this.orderNumber, required this.userId, required this.roundId, this.round, required this.status, required this.orderDate, required this.isConfirmed, required this.totalEstimatedAmount, required this.prepaymentAmount, this.finalAmount, this.amountPaid = 0, required this.deliveryType, required this.deliveryFee, final  List<OrderItemModel> items = const [], final  List<PaymentModel> payments = const []}): _items = items,_payments = payments;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String id;
@override final  int? orderNumber;
@override final  String userId;
@override final  String roundId;
@override final  RoundModel? round;
@override final  int status;
@override final  DateTime orderDate;
@override final  bool isConfirmed;
@override final  double totalEstimatedAmount;
@override final  double prepaymentAmount;
@override final  double? finalAmount;
@override@JsonKey() final  double amountPaid;
@override final  int deliveryType;
@override final  double deliveryFee;
 final  List<OrderItemModel> _items;
@override@JsonKey() List<OrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<PaymentModel> _payments;
@override@JsonKey() List<PaymentModel> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.roundId, roundId) || other.roundId == roundId)&&(identical(other.round, round) || other.round == round)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.totalEstimatedAmount, totalEstimatedAmount) || other.totalEstimatedAmount == totalEstimatedAmount)&&(identical(other.prepaymentAmount, prepaymentAmount) || other.prepaymentAmount == prepaymentAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.deliveryType, deliveryType) || other.deliveryType == deliveryType)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._payments, _payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderNumber,userId,roundId,round,status,orderDate,isConfirmed,totalEstimatedAmount,prepaymentAmount,finalAmount,amountPaid,deliveryType,deliveryFee,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'OrderModel(id: $id, orderNumber: $orderNumber, userId: $userId, roundId: $roundId, round: $round, status: $status, orderDate: $orderDate, isConfirmed: $isConfirmed, totalEstimatedAmount: $totalEstimatedAmount, prepaymentAmount: $prepaymentAmount, finalAmount: $finalAmount, amountPaid: $amountPaid, deliveryType: $deliveryType, deliveryFee: $deliveryFee, items: $items, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int? orderNumber, String userId, String roundId, RoundModel? round, int status, DateTime orderDate, bool isConfirmed, double totalEstimatedAmount, double prepaymentAmount, double? finalAmount, double amountPaid, int deliveryType, double deliveryFee, List<OrderItemModel> items, List<PaymentModel> payments
});


@override $RoundModelCopyWith<$Res>? get round;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = freezed,Object? userId = null,Object? roundId = null,Object? round = freezed,Object? status = null,Object? orderDate = null,Object? isConfirmed = null,Object? totalEstimatedAmount = null,Object? prepaymentAmount = null,Object? finalAmount = freezed,Object? amountPaid = null,Object? deliveryType = null,Object? deliveryFee = null,Object? items = null,Object? payments = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as int?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as RoundModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as DateTime,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,totalEstimatedAmount: null == totalEstimatedAmount ? _self.totalEstimatedAmount : totalEstimatedAmount // ignore: cast_nullable_to_non_nullable
as double,prepaymentAmount: null == prepaymentAmount ? _self.prepaymentAmount : prepaymentAmount // ignore: cast_nullable_to_non_nullable
as double,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double?,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentModel>,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoundModelCopyWith<$Res>? get round {
    if (_self.round == null) {
    return null;
  }

  return $RoundModelCopyWith<$Res>(_self.round!, (value) {
    return _then(_self.copyWith(round: value));
  });
}
}


/// @nodoc
mixin _$PaymentModel {

 String get id; String get orderId; String get userId; double get amount; String? get referenceId; String? get screenshotUrl; String? get notes; int get status; String? get rejectionReason; DateTime get createdAt; DateTime? get confirmedAt; String? get confirmedByAdminId;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.screenshotUrl, screenshotUrl) || other.screenshotUrl == screenshotUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.confirmedByAdminId, confirmedByAdminId) || other.confirmedByAdminId == confirmedByAdminId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,userId,amount,referenceId,screenshotUrl,notes,status,rejectionReason,createdAt,confirmedAt,confirmedByAdminId);

@override
String toString() {
  return 'PaymentModel(id: $id, orderId: $orderId, userId: $userId, amount: $amount, referenceId: $referenceId, screenshotUrl: $screenshotUrl, notes: $notes, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt, confirmedAt: $confirmedAt, confirmedByAdminId: $confirmedByAdminId)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String userId, double amount, String? referenceId, String? screenshotUrl, String? notes, int status, String? rejectionReason, DateTime createdAt, DateTime? confirmedAt, String? confirmedByAdminId
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? userId = null,Object? amount = null,Object? referenceId = freezed,Object? screenshotUrl = freezed,Object? notes = freezed,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = null,Object? confirmedAt = freezed,Object? confirmedByAdminId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,screenshotUrl: freezed == screenshotUrl ? _self.screenshotUrl : screenshotUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedByAdminId: freezed == confirmedByAdminId ? _self.confirmedByAdminId : confirmedByAdminId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String userId,  double amount,  String? referenceId,  String? screenshotUrl,  String? notes,  int status,  String? rejectionReason,  DateTime createdAt,  DateTime? confirmedAt,  String? confirmedByAdminId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.orderId,_that.userId,_that.amount,_that.referenceId,_that.screenshotUrl,_that.notes,_that.status,_that.rejectionReason,_that.createdAt,_that.confirmedAt,_that.confirmedByAdminId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String userId,  double amount,  String? referenceId,  String? screenshotUrl,  String? notes,  int status,  String? rejectionReason,  DateTime createdAt,  DateTime? confirmedAt,  String? confirmedByAdminId)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.orderId,_that.userId,_that.amount,_that.referenceId,_that.screenshotUrl,_that.notes,_that.status,_that.rejectionReason,_that.createdAt,_that.confirmedAt,_that.confirmedByAdminId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String userId,  double amount,  String? referenceId,  String? screenshotUrl,  String? notes,  int status,  String? rejectionReason,  DateTime createdAt,  DateTime? confirmedAt,  String? confirmedByAdminId)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.orderId,_that.userId,_that.amount,_that.referenceId,_that.screenshotUrl,_that.notes,_that.status,_that.rejectionReason,_that.createdAt,_that.confirmedAt,_that.confirmedByAdminId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel implements PaymentModel {
  const _PaymentModel({required this.id, required this.orderId, required this.userId, required this.amount, this.referenceId, this.screenshotUrl, this.notes, required this.status, this.rejectionReason, required this.createdAt, this.confirmedAt, this.confirmedByAdminId});
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override final  String id;
@override final  String orderId;
@override final  String userId;
@override final  double amount;
@override final  String? referenceId;
@override final  String? screenshotUrl;
@override final  String? notes;
@override final  int status;
@override final  String? rejectionReason;
@override final  DateTime createdAt;
@override final  DateTime? confirmedAt;
@override final  String? confirmedByAdminId;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.screenshotUrl, screenshotUrl) || other.screenshotUrl == screenshotUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.confirmedByAdminId, confirmedByAdminId) || other.confirmedByAdminId == confirmedByAdminId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,userId,amount,referenceId,screenshotUrl,notes,status,rejectionReason,createdAt,confirmedAt,confirmedByAdminId);

@override
String toString() {
  return 'PaymentModel(id: $id, orderId: $orderId, userId: $userId, amount: $amount, referenceId: $referenceId, screenshotUrl: $screenshotUrl, notes: $notes, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt, confirmedAt: $confirmedAt, confirmedByAdminId: $confirmedByAdminId)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String userId, double amount, String? referenceId, String? screenshotUrl, String? notes, int status, String? rejectionReason, DateTime createdAt, DateTime? confirmedAt, String? confirmedByAdminId
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? userId = null,Object? amount = null,Object? referenceId = freezed,Object? screenshotUrl = freezed,Object? notes = freezed,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = null,Object? confirmedAt = freezed,Object? confirmedByAdminId = freezed,}) {
  return _then(_PaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,screenshotUrl: freezed == screenshotUrl ? _self.screenshotUrl : screenshotUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedByAdminId: freezed == confirmedByAdminId ? _self.confirmedByAdminId : confirmedByAdminId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
