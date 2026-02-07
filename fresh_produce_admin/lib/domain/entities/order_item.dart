class OrderItem {
  final String id;
  final String productId;
  final String? productName;
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
