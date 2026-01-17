// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoundModel {

 String get id; int get roundNumber; String get neighborhoodId; NeighborhoodModel? get neighborhood; int get status; DateTime get startDate; DateTime get endDate; double get totalTransportCost;@JsonKey(name: 'roundProducts') List<RoundProductModel> get products;
/// Create a copy of RoundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundModelCopyWith<RoundModel> get copyWith => _$RoundModelCopyWithImpl<RoundModel>(this as RoundModel, _$identity);

  /// Serializes this RoundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.neighborhoodId, neighborhoodId) || other.neighborhoodId == neighborhoodId)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalTransportCost, totalTransportCost) || other.totalTransportCost == totalTransportCost)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roundNumber,neighborhoodId,neighborhood,status,startDate,endDate,totalTransportCost,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'RoundModel(id: $id, roundNumber: $roundNumber, neighborhoodId: $neighborhoodId, neighborhood: $neighborhood, status: $status, startDate: $startDate, endDate: $endDate, totalTransportCost: $totalTransportCost, products: $products)';
}


}

/// @nodoc
abstract mixin class $RoundModelCopyWith<$Res>  {
  factory $RoundModelCopyWith(RoundModel value, $Res Function(RoundModel) _then) = _$RoundModelCopyWithImpl;
@useResult
$Res call({
 String id, int roundNumber, String neighborhoodId, NeighborhoodModel? neighborhood, int status, DateTime startDate, DateTime endDate, double totalTransportCost,@JsonKey(name: 'roundProducts') List<RoundProductModel> products
});


$NeighborhoodModelCopyWith<$Res>? get neighborhood;

}
/// @nodoc
class _$RoundModelCopyWithImpl<$Res>
    implements $RoundModelCopyWith<$Res> {
  _$RoundModelCopyWithImpl(this._self, this._then);

  final RoundModel _self;
  final $Res Function(RoundModel) _then;

/// Create a copy of RoundModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roundNumber = null,Object? neighborhoodId = null,Object? neighborhood = freezed,Object? status = null,Object? startDate = null,Object? endDate = null,Object? totalTransportCost = null,Object? products = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,neighborhoodId: null == neighborhoodId ? _self.neighborhoodId : neighborhoodId // ignore: cast_nullable_to_non_nullable
as String,neighborhood: freezed == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as NeighborhoodModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalTransportCost: null == totalTransportCost ? _self.totalTransportCost : totalTransportCost // ignore: cast_nullable_to_non_nullable
as double,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<RoundProductModel>,
  ));
}
/// Create a copy of RoundModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NeighborhoodModelCopyWith<$Res>? get neighborhood {
    if (_self.neighborhood == null) {
    return null;
  }

  return $NeighborhoodModelCopyWith<$Res>(_self.neighborhood!, (value) {
    return _then(_self.copyWith(neighborhood: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoundModel].
extension RoundModelPatterns on RoundModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoundModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoundModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoundModel value)  $default,){
final _that = this;
switch (_that) {
case _RoundModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoundModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoundModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int roundNumber,  String neighborhoodId,  NeighborhoodModel? neighborhood,  int status,  DateTime startDate,  DateTime endDate,  double totalTransportCost, @JsonKey(name: 'roundProducts')  List<RoundProductModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoundModel() when $default != null:
return $default(_that.id,_that.roundNumber,_that.neighborhoodId,_that.neighborhood,_that.status,_that.startDate,_that.endDate,_that.totalTransportCost,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int roundNumber,  String neighborhoodId,  NeighborhoodModel? neighborhood,  int status,  DateTime startDate,  DateTime endDate,  double totalTransportCost, @JsonKey(name: 'roundProducts')  List<RoundProductModel> products)  $default,) {final _that = this;
switch (_that) {
case _RoundModel():
return $default(_that.id,_that.roundNumber,_that.neighborhoodId,_that.neighborhood,_that.status,_that.startDate,_that.endDate,_that.totalTransportCost,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int roundNumber,  String neighborhoodId,  NeighborhoodModel? neighborhood,  int status,  DateTime startDate,  DateTime endDate,  double totalTransportCost, @JsonKey(name: 'roundProducts')  List<RoundProductModel> products)?  $default,) {final _that = this;
switch (_that) {
case _RoundModel() when $default != null:
return $default(_that.id,_that.roundNumber,_that.neighborhoodId,_that.neighborhood,_that.status,_that.startDate,_that.endDate,_that.totalTransportCost,_that.products);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoundModel implements RoundModel {
  const _RoundModel({required this.id, this.roundNumber = 0, required this.neighborhoodId, this.neighborhood, required this.status, required this.startDate, required this.endDate, required this.totalTransportCost, @JsonKey(name: 'roundProducts') final  List<RoundProductModel> products = const []}): _products = products;
  factory _RoundModel.fromJson(Map<String, dynamic> json) => _$RoundModelFromJson(json);

@override final  String id;
@override@JsonKey() final  int roundNumber;
@override final  String neighborhoodId;
@override final  NeighborhoodModel? neighborhood;
@override final  int status;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  double totalTransportCost;
 final  List<RoundProductModel> _products;
@override@JsonKey(name: 'roundProducts') List<RoundProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of RoundModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundModelCopyWith<_RoundModel> get copyWith => __$RoundModelCopyWithImpl<_RoundModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.neighborhoodId, neighborhoodId) || other.neighborhoodId == neighborhoodId)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalTransportCost, totalTransportCost) || other.totalTransportCost == totalTransportCost)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roundNumber,neighborhoodId,neighborhood,status,startDate,endDate,totalTransportCost,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'RoundModel(id: $id, roundNumber: $roundNumber, neighborhoodId: $neighborhoodId, neighborhood: $neighborhood, status: $status, startDate: $startDate, endDate: $endDate, totalTransportCost: $totalTransportCost, products: $products)';
}


}

/// @nodoc
abstract mixin class _$RoundModelCopyWith<$Res> implements $RoundModelCopyWith<$Res> {
  factory _$RoundModelCopyWith(_RoundModel value, $Res Function(_RoundModel) _then) = __$RoundModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int roundNumber, String neighborhoodId, NeighborhoodModel? neighborhood, int status, DateTime startDate, DateTime endDate, double totalTransportCost,@JsonKey(name: 'roundProducts') List<RoundProductModel> products
});


@override $NeighborhoodModelCopyWith<$Res>? get neighborhood;

}
/// @nodoc
class __$RoundModelCopyWithImpl<$Res>
    implements _$RoundModelCopyWith<$Res> {
  __$RoundModelCopyWithImpl(this._self, this._then);

  final _RoundModel _self;
  final $Res Function(_RoundModel) _then;

/// Create a copy of RoundModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roundNumber = null,Object? neighborhoodId = null,Object? neighborhood = freezed,Object? status = null,Object? startDate = null,Object? endDate = null,Object? totalTransportCost = null,Object? products = null,}) {
  return _then(_RoundModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,neighborhoodId: null == neighborhoodId ? _self.neighborhoodId : neighborhoodId // ignore: cast_nullable_to_non_nullable
as String,neighborhood: freezed == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as NeighborhoodModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalTransportCost: null == totalTransportCost ? _self.totalTransportCost : totalTransportCost // ignore: cast_nullable_to_non_nullable
as double,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<RoundProductModel>,
  ));
}

/// Create a copy of RoundModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NeighborhoodModelCopyWith<$Res>? get neighborhood {
    if (_self.neighborhood == null) {
    return null;
  }

  return $NeighborhoodModelCopyWith<$Res>(_self.neighborhood!, (value) {
    return _then(_self.copyWith(neighborhood: value));
  });
}
}


/// @nodoc
mixin _$RoundProductModel {

 String get id; String get productId; ProductModel? get product; double get targetQuantityKg; double get minQuantityKg; double get accumulatedQuantityKg; double get estimatedWholesalePrice; double? get actualWholesalePrice; double get marginPerKg; double get operationalSharePerKg;
/// Create a copy of RoundProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundProductModelCopyWith<RoundProductModel> get copyWith => _$RoundProductModelCopyWithImpl<RoundProductModel>(this as RoundProductModel, _$identity);

  /// Serializes this RoundProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.product, product) || other.product == product)&&(identical(other.targetQuantityKg, targetQuantityKg) || other.targetQuantityKg == targetQuantityKg)&&(identical(other.minQuantityKg, minQuantityKg) || other.minQuantityKg == minQuantityKg)&&(identical(other.accumulatedQuantityKg, accumulatedQuantityKg) || other.accumulatedQuantityKg == accumulatedQuantityKg)&&(identical(other.estimatedWholesalePrice, estimatedWholesalePrice) || other.estimatedWholesalePrice == estimatedWholesalePrice)&&(identical(other.actualWholesalePrice, actualWholesalePrice) || other.actualWholesalePrice == actualWholesalePrice)&&(identical(other.marginPerKg, marginPerKg) || other.marginPerKg == marginPerKg)&&(identical(other.operationalSharePerKg, operationalSharePerKg) || other.operationalSharePerKg == operationalSharePerKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,product,targetQuantityKg,minQuantityKg,accumulatedQuantityKg,estimatedWholesalePrice,actualWholesalePrice,marginPerKg,operationalSharePerKg);

@override
String toString() {
  return 'RoundProductModel(id: $id, productId: $productId, product: $product, targetQuantityKg: $targetQuantityKg, minQuantityKg: $minQuantityKg, accumulatedQuantityKg: $accumulatedQuantityKg, estimatedWholesalePrice: $estimatedWholesalePrice, actualWholesalePrice: $actualWholesalePrice, marginPerKg: $marginPerKg, operationalSharePerKg: $operationalSharePerKg)';
}


}

/// @nodoc
abstract mixin class $RoundProductModelCopyWith<$Res>  {
  factory $RoundProductModelCopyWith(RoundProductModel value, $Res Function(RoundProductModel) _then) = _$RoundProductModelCopyWithImpl;
@useResult
$Res call({
 String id, String productId, ProductModel? product, double targetQuantityKg, double minQuantityKg, double accumulatedQuantityKg, double estimatedWholesalePrice, double? actualWholesalePrice, double marginPerKg, double operationalSharePerKg
});


$ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$RoundProductModelCopyWithImpl<$Res>
    implements $RoundProductModelCopyWith<$Res> {
  _$RoundProductModelCopyWithImpl(this._self, this._then);

  final RoundProductModel _self;
  final $Res Function(RoundProductModel) _then;

/// Create a copy of RoundProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? product = freezed,Object? targetQuantityKg = null,Object? minQuantityKg = null,Object? accumulatedQuantityKg = null,Object? estimatedWholesalePrice = null,Object? actualWholesalePrice = freezed,Object? marginPerKg = null,Object? operationalSharePerKg = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,targetQuantityKg: null == targetQuantityKg ? _self.targetQuantityKg : targetQuantityKg // ignore: cast_nullable_to_non_nullable
as double,minQuantityKg: null == minQuantityKg ? _self.minQuantityKg : minQuantityKg // ignore: cast_nullable_to_non_nullable
as double,accumulatedQuantityKg: null == accumulatedQuantityKg ? _self.accumulatedQuantityKg : accumulatedQuantityKg // ignore: cast_nullable_to_non_nullable
as double,estimatedWholesalePrice: null == estimatedWholesalePrice ? _self.estimatedWholesalePrice : estimatedWholesalePrice // ignore: cast_nullable_to_non_nullable
as double,actualWholesalePrice: freezed == actualWholesalePrice ? _self.actualWholesalePrice : actualWholesalePrice // ignore: cast_nullable_to_non_nullable
as double?,marginPerKg: null == marginPerKg ? _self.marginPerKg : marginPerKg // ignore: cast_nullable_to_non_nullable
as double,operationalSharePerKg: null == operationalSharePerKg ? _self.operationalSharePerKg : operationalSharePerKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of RoundProductModel
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


/// Adds pattern-matching-related methods to [RoundProductModel].
extension RoundProductModelPatterns on RoundProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoundProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoundProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoundProductModel value)  $default,){
final _that = this;
switch (_that) {
case _RoundProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoundProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoundProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  ProductModel? product,  double targetQuantityKg,  double minQuantityKg,  double accumulatedQuantityKg,  double estimatedWholesalePrice,  double? actualWholesalePrice,  double marginPerKg,  double operationalSharePerKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoundProductModel() when $default != null:
return $default(_that.id,_that.productId,_that.product,_that.targetQuantityKg,_that.minQuantityKg,_that.accumulatedQuantityKg,_that.estimatedWholesalePrice,_that.actualWholesalePrice,_that.marginPerKg,_that.operationalSharePerKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  ProductModel? product,  double targetQuantityKg,  double minQuantityKg,  double accumulatedQuantityKg,  double estimatedWholesalePrice,  double? actualWholesalePrice,  double marginPerKg,  double operationalSharePerKg)  $default,) {final _that = this;
switch (_that) {
case _RoundProductModel():
return $default(_that.id,_that.productId,_that.product,_that.targetQuantityKg,_that.minQuantityKg,_that.accumulatedQuantityKg,_that.estimatedWholesalePrice,_that.actualWholesalePrice,_that.marginPerKg,_that.operationalSharePerKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  ProductModel? product,  double targetQuantityKg,  double minQuantityKg,  double accumulatedQuantityKg,  double estimatedWholesalePrice,  double? actualWholesalePrice,  double marginPerKg,  double operationalSharePerKg)?  $default,) {final _that = this;
switch (_that) {
case _RoundProductModel() when $default != null:
return $default(_that.id,_that.productId,_that.product,_that.targetQuantityKg,_that.minQuantityKg,_that.accumulatedQuantityKg,_that.estimatedWholesalePrice,_that.actualWholesalePrice,_that.marginPerKg,_that.operationalSharePerKg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoundProductModel implements RoundProductModel {
  const _RoundProductModel({required this.id, required this.productId, this.product, required this.targetQuantityKg, required this.minQuantityKg, required this.accumulatedQuantityKg, required this.estimatedWholesalePrice, this.actualWholesalePrice, required this.marginPerKg, required this.operationalSharePerKg});
  factory _RoundProductModel.fromJson(Map<String, dynamic> json) => _$RoundProductModelFromJson(json);

@override final  String id;
@override final  String productId;
@override final  ProductModel? product;
@override final  double targetQuantityKg;
@override final  double minQuantityKg;
@override final  double accumulatedQuantityKg;
@override final  double estimatedWholesalePrice;
@override final  double? actualWholesalePrice;
@override final  double marginPerKg;
@override final  double operationalSharePerKg;

/// Create a copy of RoundProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundProductModelCopyWith<_RoundProductModel> get copyWith => __$RoundProductModelCopyWithImpl<_RoundProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoundProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoundProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.product, product) || other.product == product)&&(identical(other.targetQuantityKg, targetQuantityKg) || other.targetQuantityKg == targetQuantityKg)&&(identical(other.minQuantityKg, minQuantityKg) || other.minQuantityKg == minQuantityKg)&&(identical(other.accumulatedQuantityKg, accumulatedQuantityKg) || other.accumulatedQuantityKg == accumulatedQuantityKg)&&(identical(other.estimatedWholesalePrice, estimatedWholesalePrice) || other.estimatedWholesalePrice == estimatedWholesalePrice)&&(identical(other.actualWholesalePrice, actualWholesalePrice) || other.actualWholesalePrice == actualWholesalePrice)&&(identical(other.marginPerKg, marginPerKg) || other.marginPerKg == marginPerKg)&&(identical(other.operationalSharePerKg, operationalSharePerKg) || other.operationalSharePerKg == operationalSharePerKg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,product,targetQuantityKg,minQuantityKg,accumulatedQuantityKg,estimatedWholesalePrice,actualWholesalePrice,marginPerKg,operationalSharePerKg);

@override
String toString() {
  return 'RoundProductModel(id: $id, productId: $productId, product: $product, targetQuantityKg: $targetQuantityKg, minQuantityKg: $minQuantityKg, accumulatedQuantityKg: $accumulatedQuantityKg, estimatedWholesalePrice: $estimatedWholesalePrice, actualWholesalePrice: $actualWholesalePrice, marginPerKg: $marginPerKg, operationalSharePerKg: $operationalSharePerKg)';
}


}

/// @nodoc
abstract mixin class _$RoundProductModelCopyWith<$Res> implements $RoundProductModelCopyWith<$Res> {
  factory _$RoundProductModelCopyWith(_RoundProductModel value, $Res Function(_RoundProductModel) _then) = __$RoundProductModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, ProductModel? product, double targetQuantityKg, double minQuantityKg, double accumulatedQuantityKg, double estimatedWholesalePrice, double? actualWholesalePrice, double marginPerKg, double operationalSharePerKg
});


@override $ProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$RoundProductModelCopyWithImpl<$Res>
    implements _$RoundProductModelCopyWith<$Res> {
  __$RoundProductModelCopyWithImpl(this._self, this._then);

  final _RoundProductModel _self;
  final $Res Function(_RoundProductModel) _then;

/// Create a copy of RoundProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? product = freezed,Object? targetQuantityKg = null,Object? minQuantityKg = null,Object? accumulatedQuantityKg = null,Object? estimatedWholesalePrice = null,Object? actualWholesalePrice = freezed,Object? marginPerKg = null,Object? operationalSharePerKg = null,}) {
  return _then(_RoundProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,targetQuantityKg: null == targetQuantityKg ? _self.targetQuantityKg : targetQuantityKg // ignore: cast_nullable_to_non_nullable
as double,minQuantityKg: null == minQuantityKg ? _self.minQuantityKg : minQuantityKg // ignore: cast_nullable_to_non_nullable
as double,accumulatedQuantityKg: null == accumulatedQuantityKg ? _self.accumulatedQuantityKg : accumulatedQuantityKg // ignore: cast_nullable_to_non_nullable
as double,estimatedWholesalePrice: null == estimatedWholesalePrice ? _self.estimatedWholesalePrice : estimatedWholesalePrice // ignore: cast_nullable_to_non_nullable
as double,actualWholesalePrice: freezed == actualWholesalePrice ? _self.actualWholesalePrice : actualWholesalePrice // ignore: cast_nullable_to_non_nullable
as double?,marginPerKg: null == marginPerKg ? _self.marginPerKg : marginPerKg // ignore: cast_nullable_to_non_nullable
as double,operationalSharePerKg: null == operationalSharePerKg ? _self.operationalSharePerKg : operationalSharePerKg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of RoundProductModel
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

// dart format on
