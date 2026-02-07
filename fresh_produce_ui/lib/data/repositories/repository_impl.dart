import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/round.dart';
import '../../domain/entities/round_product.dart';
import '../../domain/entities/round_status.dart';
import '../../domain/repositories/repository_interface.dart';
import '../data_sources/remote_data_source.dart';
import '../models/order_model.dart';
import '../models/requests/place_order_request_model.dart';
import '../models/round_model.dart';

class RepositoryImpl implements IRepository {
  final IRemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<void> confirmOrder(String orderId) async {
    await _remoteDataSource.confirmPrice(orderId);
  }

  @override
  Future<List<Round>> getActiveRounds(String neighborhoodId) async {
    final models = await _remoteDataSource.getActiveRounds(neighborhoodId);
    return models.map((m) => _mapRoundModelToEntity(m)).toList();
  }

  @override
  Future<List<Order>> getMyOrders() async {
    final models = await _remoteDataSource.getMyOrders();
    return models.map((m) => _mapOrderModelToEntity(m)).toList();
  }

  @override
  Future<List<Neighborhood>> getNeighborhoods() async {
    final models = await _remoteDataSource.getNeighborhoods();
    return models
        .map(
          (m) => Neighborhood(
            id: m.id,
            name: m.name,
            city: m.city,
            deliveryFee: m.deliveryFee,
            pickupPointAddress: m.pickupPointAddress,
            pickupPointNotes: m.pickupPointNotes,
          ),
        )
        .toList();
  }

  @override
  Future<void> placeOrder({
    required String roundId,
    required List<Map<String, dynamic>> items,
    required int deliveryType,
    String? deliveryAddress,
    String? deliveryPhone,
  }) async {
    final requestModel = PlaceOrderRequestModel(
      roundId: roundId,
      items: items
          .map(
            (i) => OrderItemRequestModel(
              productId: i['productId'] as String,
              quantityKg: (i['quantityKg'] as num).toDouble(),
            ),
          )
          .toList(),
      deliveryType: deliveryType,
      deliveryAddress: deliveryAddress,
      deliveryPhone: deliveryPhone,
    );

    await _remoteDataSource.placeOrder(requestModel);
  }

  @override
  Future<void> rejectOrder(String orderId) async {
    await _remoteDataSource.rejectOrder(orderId);
  }

  Order _mapOrderModelToEntity(OrderModel m) {
    return Order(
      id: m.id,
      orderNumber: m.orderNumber,
      userId: m.userId,
      roundId: m.roundId,
      round: m.round != null ? _mapRoundModelToEntity(m.round!) : null,
      status: OrderStatus.values[m.status],
      orderDate: m.orderDate,
      isConfirmed: m.isConfirmed,
      totalEstimatedAmount: m.totalEstimatedAmount,
      prepaymentAmount: m.prepaymentAmount,
      finalAmount: m.finalAmount,
      deliveryType: m.deliveryType,
      deliveryFee: m.deliveryFee,
      items: m.items
          .map(
            (i) => OrderItem(
              id: i.id,
              productId: i.productId,
              product: i.product != null
                  ? Product(
                      id: i.product!.id,
                      name: i.product!.name,
                      unit: i.product!.unit,
                      imageUrl: i.product!.imageUrl,
                    )
                  : null,
              quantityKg: i.quantityKg,
              estimatedPricePerKg: i.estimatedPricePerKg,
              finalPricePerKg: i.finalPricePerKg,
            ),
          )
          .toList(),
    );
  }

  Round _mapRoundModelToEntity(RoundModel m) {
    final double totalTargetWeight = m.products.fold(
      0.0,
      (sum, p) => sum + p.targetQuantityKg,
    );
    final double totalAccumulatedWeight = m.products.fold(
      0.0,
      (sum, p) => sum + p.accumulatedQuantityKg,
    );

    final double transportCost = m.totalTransportCost;
    final double estShare = totalTargetWeight > 0
        ? transportCost / totalTargetWeight
        : 0.0;

    final double referenceWeight = totalAccumulatedWeight > totalTargetWeight
        ? totalAccumulatedWeight
        : totalTargetWeight;
    final double actShare = referenceWeight > 0
        ? transportCost / referenceWeight
        : 0.0;

    return Round(
      id: m.id,
      roundNumber: m.roundNumber,
      neighborhoodId: m.neighborhoodId,
      neighborhood: m.neighborhood != null
          ? Neighborhood(
              id: m.neighborhood!.id,
              name: m.neighborhood!.name,
              city: m.neighborhood!.city,
              deliveryFee: m.neighborhood!.deliveryFee,
              pickupPointAddress: m.neighborhood!.pickupPointAddress,
              pickupPointNotes: m.neighborhood!.pickupPointNotes,
            )
          : null,
      status: RoundStatus.values[m.status],
      startDate: m.startDate,
      endDate: m.endDate,
      totalTransportCost: m.totalTransportCost,
      products: m.products
          .map(
            (rp) => RoundProduct(
              id: rp.id,
              productId: rp.productId,
              product: rp.product != null
                  ? Product(
                      id: rp.product!.id,
                      name: rp.product!.name,
                      unit: rp.product!.unit,
                      imageUrl: rp.product!.imageUrl,
                    )
                  : null,
              targetQuantityKg: rp.targetQuantityKg,
              minQuantityKg: rp.minQuantityKg,
              accumulatedQuantityKg: rp.accumulatedQuantityKg,
              estimatedWholesalePrice: rp.estimatedWholesalePrice,
              actualWholesalePrice: rp.actualWholesalePrice,
              marginPerKg: rp.marginPerKg,
              operationalSharePerKg: rp.operationalSharePerKg,
              estimatedTransportSharePerKg: estShare,
              actualTransportSharePerKg: actShare,
            ),
          )
          .toList(),
    );
  }
}
