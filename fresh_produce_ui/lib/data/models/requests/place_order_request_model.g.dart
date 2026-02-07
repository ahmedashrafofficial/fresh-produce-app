// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemRequestModel _$OrderItemRequestModelFromJson(
  Map<String, dynamic> json,
) => _OrderItemRequestModel(
  productId: json['productId'] as String,
  quantityKg: (json['quantityKg'] as num).toDouble(),
);

Map<String, dynamic> _$OrderItemRequestModelToJson(
  _OrderItemRequestModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantityKg': instance.quantityKg,
};

_PlaceOrderRequestModel _$PlaceOrderRequestModelFromJson(
  Map<String, dynamic> json,
) => _PlaceOrderRequestModel(
  roundId: json['roundId'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemRequestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  deliveryType: (json['deliveryType'] as num).toInt(),
  deliveryAddress: json['deliveryAddress'] as String?,
  deliveryPhone: json['deliveryPhone'] as String?,
);

Map<String, dynamic> _$PlaceOrderRequestModelToJson(
  _PlaceOrderRequestModel instance,
) => <String, dynamic>{
  'roundId': instance.roundId,
  'items': instance.items,
  'deliveryType': instance.deliveryType,
  'deliveryAddress': instance.deliveryAddress,
  'deliveryPhone': instance.deliveryPhone,
};
