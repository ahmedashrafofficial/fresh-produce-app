import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@Freezed()
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

@Freezed()
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    @Default(0) int orderNumber,
    required String userId,
    String? userName,
    required String roundId,
    required int status,
    required DateTime orderDate,
    required int deliveryType,
    required double deliveryFee,
    required double totalEstimatedAmount,
    required double prepaymentAmount,
    double? finalAmount,
    @Default([]) List<OrderItemModel> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
