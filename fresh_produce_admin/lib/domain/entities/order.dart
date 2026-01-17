class Order {
  final String id;
  final int orderNumber; // New friendly ID
  final String userId;
  final String? userName; // New User Name
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

class OrderItem {
  final String id;
  final String productId;
  final String? productName; // Product Name from backend
  final double quantityKg;
  final double estimatedPricePerKg;

  OrderItem({
    required this.id,
    required this.productId,
    this.productName,
    required this.quantityKg,
    required this.estimatedPricePerKg,
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
