import 'package:dio/dio.dart';

import '../../core/constants/api_endpoints.dart';
import '../models/neighborhood_model.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';
import '../models/round_model.dart';

class AdminRemoteDataSource implements IAdminRemoteDataSource {
  final Dio _dio;

  AdminRemoteDataSource(this._dio);

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    final response = await _dio.post(
      ApiEndpoints.products,
      data: product.toJson(),
    );
    return ProductModel.fromJson(response.data);
  }

  @override
  Future<RoundModel> createRound(RoundModel round) async {
    final data = round.toJson();
    //Backend expects roundProducts inside
    final response = await _dio.post(ApiEndpoints.createRound, data: data);
    return RoundModel.fromJson(response.data);
  }

  @override
  Future<List<NeighborhoodModel>> getNeighborhoods() async {
    final response = await _dio.get(ApiEndpoints.neighborhoods);
    return (response.data as List)
        .map((e) => NeighborhoodModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await _dio.get(ApiEndpoints.orders);
    return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get(ApiEndpoints.products);
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<RoundModel>> getRounds() async {
    final response = await _dio.get(ApiEndpoints.rounds);
    return (response.data as List).map((e) => RoundModel.fromJson(e)).toList();
  }

  @override
  Future<void> updateOrderStatus(String orderId, String status) async {
    await _dio.put(
      ApiEndpoints.updateOrderStatus(orderId),
      queryParameters: {'status': status},
    );
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await _dio.put(
      '${ApiEndpoints.products}/${product.id}',
      data: product.toJson(),
    );
  }

  @override
  Future<void> updateRound(RoundModel round) async {
    await _dio.put(ApiEndpoints.updateRound(round.id), data: round.toJson());
  }
}

abstract class IAdminRemoteDataSource {
  Future<ProductModel> createProduct(ProductModel product);
  Future<RoundModel> createRound(RoundModel round);
  Future<List<NeighborhoodModel>> getNeighborhoods();

  Future<List<OrderModel>> getOrders();

  Future<List<ProductModel>> getProducts();
  Future<List<RoundModel>> getRounds();
  Future<void> updateOrderStatus(String orderId, String status);

  Future<void> updateProduct(ProductModel product);
  Future<void> updateRound(RoundModel round);
}
