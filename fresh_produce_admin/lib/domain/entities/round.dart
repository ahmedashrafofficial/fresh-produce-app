import 'product.dart';

class Round {
  final String id;
  final int roundNumber; // New friendly ID
  final String neighborhoodId;
  final RoundStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final double totalTransportCost;
  final List<RoundProduct> roundProducts;

  Round({
    required this.id,
    required this.roundNumber,
    required this.neighborhoodId,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.totalTransportCost,
    required this.roundProducts,
  });
}

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

enum RoundStatus {
  draft,
  open,
  locked,
  finished,
  delivering,
  delivered,
  completed,
  cancelled,
}
