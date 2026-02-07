import 'product.dart';

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
