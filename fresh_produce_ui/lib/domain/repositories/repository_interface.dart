import '../entities/neighborhood.dart';
import '../entities/order.dart';
import '../entities/round.dart';

abstract class IRepository {
  Future<void> confirmOrder(String orderId);
  Future<List<Round>> getActiveRounds(String neighborhoodId);
  Future<List<Order>> getMyOrders();
  Future<List<Neighborhood>> getNeighborhoods();
  Future<void> placeOrder({
    required String roundId,
    required List<Map<String, dynamic>> items,
    required int deliveryType,
    String? deliveryAddress,
    String? deliveryPhone,
  });
  Future<void> rejectOrder(String orderId);
}
