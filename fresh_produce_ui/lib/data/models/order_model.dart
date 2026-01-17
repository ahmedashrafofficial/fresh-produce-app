import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_model.dart';
import 'round_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String id,
    required String productId,
    ProductModel? product,
    required double quantityKg,
    required double estimatedPricePerKg,
    double? finalPricePerKg,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    int? orderNumber,
    required String userId,
    required String roundId,
    RoundModel? round,
    required int status,
    required DateTime orderDate,
    required bool isConfirmed,
    required double totalEstimatedAmount,
    required double prepaymentAmount,
    double? finalAmount,
    @Default(0) double amountPaid,
    required int deliveryType,
    required double deliveryFee,
    @Default([]) List<OrderItemModel> items,
    @Default([]) List<PaymentModel> payments,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
abstract class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    required String orderId,
    required String userId,
    required double amount,
    String? referenceId,
    String? screenshotUrl,
    String? notes,
    required int status,
    String? rejectionReason,
    required DateTime createdAt,
    DateTime? confirmedAt,
    String? confirmedByAdminId,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
