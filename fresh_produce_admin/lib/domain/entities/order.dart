import 'order_item.dart';
import 'order_status.dart';

class Order {
  final String id;
  final int orderNumber;
  final String userId;
  final String? userName;
  final String roundId;
  final OrderStatus status;
  final DateTime orderDate;
  final double totalEstimatedAmount;
  final List<OrderItem> items;

  Order({
    required this.id,
    required this.orderNumber,
    required this.userId,
    this.userName,
    required this.roundId,
    required this.status,
    required this.orderDate,
    required this.totalEstimatedAmount,
    required this.items,
  });
}
