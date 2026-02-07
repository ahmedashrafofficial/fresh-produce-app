import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_request_model.freezed.dart';
part 'place_order_request_model.g.dart';

@Freezed()
abstract class OrderItemRequestModel with _$OrderItemRequestModel {
  const factory OrderItemRequestModel({
    required String productId,
    required double quantityKg,
  }) = _OrderItemRequestModel;

  factory OrderItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRequestModelFromJson(json);
}

@Freezed()
abstract class PlaceOrderRequestModel with _$PlaceOrderRequestModel {
  const factory PlaceOrderRequestModel({
    required String roundId,
    required List<OrderItemRequestModel> items,
    required int deliveryType,
    String? deliveryAddress,
    String? deliveryPhone,
  }) = _PlaceOrderRequestModel;

  factory PlaceOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestModelFromJson(json);
}
