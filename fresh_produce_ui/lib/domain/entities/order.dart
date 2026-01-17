import 'product.dart';
import 'round.dart';

class Order {
  final String id;
  final int? orderNumber;
  final String userId;
  final String roundId;
  final Round? round;
  final OrderStatus status;
  final DateTime orderDate;
  final bool isConfirmed;
  final double totalEstimatedAmount;
  final double prepaymentAmount;
  final double? finalAmount;
  final int deliveryType;
  final double deliveryFee;
  final List<OrderItem> items;

  Order({
    required this.id,
    this.orderNumber,
    required this.userId,
    required this.roundId,
    this.round,
    required this.status,
    required this.orderDate,
    required this.isConfirmed,
    required this.totalEstimatedAmount,
    required this.prepaymentAmount,
    this.finalAmount,
    required this.deliveryType,
    required this.deliveryFee,
    required this.items,
  });
}

class OrderItem {
  final String id;
  final String productId;
  final Product? product;
  final double quantityKg;
  final double estimatedPricePerKg;
  final double? finalPricePerKg;

  OrderItem({
    required this.id,
    required this.productId,
    this.product,
    required this.quantityKg,
    required this.estimatedPricePerKg,
    this.finalPricePerKg,
  });
}

enum OrderStatus {
  placed,
  awaitingConfirmation,
  confirmed,
  rejected,
  paid,
  delivered,
  cancelled,
}
