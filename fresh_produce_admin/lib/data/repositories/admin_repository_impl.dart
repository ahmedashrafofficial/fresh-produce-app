import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/round.dart';
import '../../domain/repositories/admin_repository.dart';
import '../data_sources/admin_remote_data_source.dart';
import '../models/product_model.dart';
import '../models/round_model.dart';

class AdminRepositoryImpl implements IAdminRepository {
  final IAdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Neighborhood>> getNeighborhoods() async {
    final models = await _remoteDataSource.getNeighborhoods();
    return models
        .map((m) => Neighborhood(id: m.id, name: m.name, city: m.city))
        .toList();
  }

  @override
  Future<List<Order>> getOrders() async {
    final models = await _remoteDataSource.getOrders();
    return models
        .map(
          (m) => Order(
            id: m.id,
            orderNumber: m.orderNumber,
            userId: m.userId,
            userName: m.userName,
            roundId: m.roundId,
            status: OrderStatus.values[m.status],
            orderDate: m.orderDate,
            totalEstimatedAmount: m.totalEstimatedAmount,
            items: m.items
                .map(
                  (i) => OrderItem(
                    id: i.id,
                    productId: i.productId,
                    productName: i.product?.name,
                    quantityKg: i.quantityKg,
                    estimatedPricePerKg: i.estimatedPricePerKg,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Future<List<Product>> getProducts() async {
    final models = await _remoteDataSource.getProducts();
    return models
        .map(
          (m) => Product(
            id: m.id,
            name: m.name,
            unit: m.unit,
            minInventoryAmount: m.minInventoryAmount,
            imageUrl: m.imageUrl,
            estimatedWholesalePrice: m.estimatedWholesalePrice,
          ),
        )
        .toList();
  }

  @override
  Future<List<Round>> getRounds() async {
    final models = await _remoteDataSource.getRounds();
    return models
        .map(
          (m) => Round(
            id: m.id,
            roundNumber: m.roundNumber,
            neighborhoodId: m.neighborhoodId,
            status: RoundStatus.values[m.status],
            startDate: m.startDate,
            endDate: m.endDate,
            totalTransportCost: m.totalTransportCost,
            roundProducts: m.roundProducts
                .map(
                  (rp) => RoundProduct(
                    id: rp.id,
                    productId: rp.productId,
                    product: rp.product != null
                        ? Product(
                            id: rp.product!.id,
                            name: rp.product!.name,
                            unit: rp.product!.unit,
                            minInventoryAmount: rp.product!.minInventoryAmount,
                            imageUrl: rp.product!.imageUrl,
                          )
                        : null,
                    targetQuantityKg: rp.targetQuantityKg,
                    accumulatedQuantityKg: rp.accumulatedQuantityKg,
                    estimatedWholesalePrice: rp.estimatedWholesalePrice,
                    actualWholesalePrice: rp.actualWholesalePrice,
                    marginPerKg: rp.marginPerKg,
                    operationalSharePerKg: rp.operationalSharePerKg,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Future<Product> saveProduct(Product product) async {
    final model = ProductModel(
      id: product.id,
      name: product.name,
      unit: product.unit,
      minInventoryAmount: product.minInventoryAmount,
      imageUrl: product.imageUrl,
      estimatedWholesalePrice: product.estimatedWholesalePrice,
    );

    if (product.id.isEmpty || product.id == '0') {
      final res = await _remoteDataSource.createProduct(model);
      return Product(
        id: res.id,
        name: res.name,
        unit: res.unit,
        minInventoryAmount: res.minInventoryAmount,
        imageUrl: res.imageUrl,
        estimatedWholesalePrice: res.estimatedWholesalePrice,
      );
    } else {
      await _remoteDataSource.updateProduct(model);
      return product;
    }
  }

  @override
  Future<void> saveRound(Round round) async {
    final model = RoundModel(
      id: (round.id.isEmpty || round.id == '0')
          ? '00000000-0000-0000-0000-000000000000'
          : round.id,
      neighborhoodId: round.neighborhoodId,
      status: round.status.index,
      startDate: round.startDate,
      endDate: round.endDate,
      totalTransportCost: round.totalTransportCost,
      roundProducts: round.roundProducts
          .map(
            (rp) => RoundProductModel(
              id: rp.id.isEmpty
                  ? '00000000-0000-0000-0000-000000000000'
                  : rp.id,
              productId: rp.productId,
              targetQuantityKg: rp.targetQuantityKg,
              accumulatedQuantityKg: rp.accumulatedQuantityKg,
              estimatedWholesalePrice: rp.estimatedWholesalePrice,
              actualWholesalePrice: rp.actualWholesalePrice,
              marginPerKg: rp.marginPerKg,
              operationalSharePerKg: rp.operationalSharePerKg,
            ),
          )
          .toList(),
    );

    if (round.id.isEmpty || round.id == '0') {
      await _remoteDataSource.createRound(model);
    } else {
      await _remoteDataSource.updateRound(model);
    }
  }

  @override
  Future<void> updateOrderStatus(String orderId, String status) async {
    await _remoteDataSource.updateOrderStatus(orderId, status);
  }
}
