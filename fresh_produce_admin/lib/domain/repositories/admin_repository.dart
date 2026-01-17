import '../entities/neighborhood.dart';
import '../entities/order.dart';
import '../entities/product.dart';
import '../entities/round.dart';

abstract class IAdminRepository {
  Future<List<Neighborhood>> getNeighborhoods();
  Future<List<Order>> getOrders();
  Future<List<Product>> getProducts();

  Future<List<Round>> getRounds();
  Future<Product> saveProduct(Product product);

  Future<void> saveRound(Round round);
  Future<void> updateOrderStatus(String orderId, String status);
}
