import '../../../domain/entities/round_product.dart';

extension RoundProductHelper on RoundProduct {
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
