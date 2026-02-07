import 'round_product.dart';
import 'round_status.dart';

class Round {
  final String id;
  final int roundNumber;
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
