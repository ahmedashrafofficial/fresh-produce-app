import 'product.dart';

class RoundProduct {
  final String id;
  final String productId;
  final Product? product;
  double targetQuantityKg;
  double accumulatedQuantityKg;
  double estimatedWholesalePrice;
  double? actualWholesalePrice;
  double marginPerKg;
  double operationalSharePerKg;

  RoundProduct({
    required this.id,
    required this.productId,
    this.product,
    required this.targetQuantityKg,
    required this.accumulatedQuantityKg,
    required this.estimatedWholesalePrice,
    this.actualWholesalePrice,
    required this.marginPerKg,
    required this.operationalSharePerKg,
  });
}
