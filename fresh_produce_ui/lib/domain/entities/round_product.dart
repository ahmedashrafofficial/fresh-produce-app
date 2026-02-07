import 'product.dart';

class RoundProduct {
  final String id;
  final String productId;
  final Product? product;
  final double targetQuantityKg;
  final double minQuantityKg;
  final double accumulatedQuantityKg;
  final double estimatedWholesalePrice;
  final double? actualWholesalePrice;
  final double marginPerKg;
  final double operationalSharePerKg;
  final double estimatedTransportSharePerKg;
  final double actualTransportSharePerKg;

  RoundProduct({
    required this.id,
    required this.productId,
    this.product,
    required this.targetQuantityKg,
    required this.minQuantityKg,
    required this.accumulatedQuantityKg,
    required this.estimatedWholesalePrice,
    this.actualWholesalePrice,
    required this.marginPerKg,
    required this.operationalSharePerKg,
    required this.estimatedTransportSharePerKg,
    required this.actualTransportSharePerKg,
  });
}
