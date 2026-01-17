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
  orderNumber: (json['orderNumber'] as num?)?.toInt(),
  userId: json['userId'] as String,
  roundId: json['roundId'] as String,
  round: json['round'] == null
      ? null
      : RoundModel.fromJson(json['round'] as Map<String, dynamic>),
  status: (json['status'] as num).toInt(),
  orderDate: DateTime.parse(json['orderDate'] as String),
  isConfirmed: json['isConfirmed'] as bool,
  totalEstimatedAmount: (json['totalEstimatedAmount'] as num).toDouble(),
  prepaymentAmount: (json['prepaymentAmount'] as num).toDouble(),
  finalAmount: (json['finalAmount'] as num?)?.toDouble(),
  amountPaid: (json['amountPaid'] as num?)?.toDouble() ?? 0,
  deliveryType: (json['deliveryType'] as num).toInt(),
  deliveryFee: (json['deliveryFee'] as num).toDouble(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  payments:
      (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'userId': instance.userId,
      'roundId': instance.roundId,
      'round': instance.round,
      'status': instance.status,
      'orderDate': instance.orderDate.toIso8601String(),
      'isConfirmed': instance.isConfirmed,
      'totalEstimatedAmount': instance.totalEstimatedAmount,
      'prepaymentAmount': instance.prepaymentAmount,
      'finalAmount': instance.finalAmount,
      'amountPaid': instance.amountPaid,
      'deliveryType': instance.deliveryType,
      'deliveryFee': instance.deliveryFee,
      'items': instance.items,
      'payments': instance.payments,
    };

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      referenceId: json['referenceId'] as String?,
      screenshotUrl: json['screenshotUrl'] as String?,
      notes: json['notes'] as String?,
      status: (json['status'] as num).toInt(),
      rejectionReason: json['rejectionReason'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
      confirmedByAdminId: json['confirmedByAdminId'] as String?,
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'userId': instance.userId,
      'amount': instance.amount,
      'referenceId': instance.referenceId,
      'screenshotUrl': instance.screenshotUrl,
      'notes': instance.notes,
      'status': instance.status,
      'rejectionReason': instance.rejectionReason,
      'createdAt': instance.createdAt.toIso8601String(),
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
      'confirmedByAdminId': instance.confirmedByAdminId,
    };
