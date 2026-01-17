// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantityKg: (json['quantityKg'] as num).toDouble(),
      estimatedPricePerKg: (json['estimatedPricePerKg'] as num).toDouble(),
      finalPricePerKg: (json['finalPricePerKg'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'product': instance.product,
      'quantityKg': instance.quantityKg,
      'estimatedPricePerKg': instance.estimatedPricePerKg,
      'finalPricePerKg': instance.finalPricePerKg,
    };

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  orderNumber: (json['orderNumber'] as num?)?.toInt() ?? 0,
  userId: json['userId'] as String,
  userName: json['userName'] as String?,
  roundId: json['roundId'] as String,
  status: (json['status'] as num).toInt(),
  orderDate: DateTime.parse(json['orderDate'] as String),
  deliveryType: (json['deliveryType'] as num).toInt(),
  deliveryFee: (json['deliveryFee'] as num).toDouble(),
  totalEstimatedAmount: (json['totalEstimatedAmount'] as num).toDouble(),
  prepaymentAmount: (json['prepaymentAmount'] as num).toDouble(),
  finalAmount: (json['finalAmount'] as num?)?.toDouble(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'userId': instance.userId,
      'userName': instance.userName,
      'roundId': instance.roundId,
      'status': instance.status,
      'orderDate': instance.orderDate.toIso8601String(),
      'deliveryType': instance.deliveryType,
      'deliveryFee': instance.deliveryFee,
      'totalEstimatedAmount': instance.totalEstimatedAmount,
      'prepaymentAmount': instance.prepaymentAmount,
      'finalAmount': instance.finalAmount,
      'items': instance.items,
    };
