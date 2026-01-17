import 'neighborhood.dart';
import 'product.dart';

class Round {
  final String id;
  final int roundNumber;
  final String neighborhoodId;
  final Neighborhood? neighborhood;
  final RoundStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final double totalTransportCost;
  final List<RoundProduct> products;

  Round({
    required this.id,
    required this.roundNumber,
    required this.neighborhoodId,
    this.neighborhood,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.totalTransportCost,
    required this.products,
  });
}

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

  double? get actualCustomerPrice => actualWholesalePrice == null
      ? null
      : actualWholesalePrice! +
            marginPerKg +
            operationalSharePerKg +
            actualTransportSharePerKg;

  double get estimatedCustomerPrice =>
      estimatedWholesalePrice +
      marginPerKg +
      operationalSharePerKg +
      estimatedTransportSharePerKg;

  double get progress =>
      (accumulatedQuantityKg / targetQuantityKg).clamp(0.0, 1.0);

  double get remainingKg =>
      (targetQuantityKg - accumulatedQuantityKg).clamp(0.0, targetQuantityKg);
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
