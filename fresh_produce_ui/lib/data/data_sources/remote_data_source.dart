import 'package:dio/dio.dart';

import '../../core/constants/api_endpoints.dart';
import '../models/neighborhood_model.dart';
import '../models/order_model.dart';
import '../models/round_model.dart';

abstract class IRemoteDataSource {
  Future<void> confirmPrice(String orderId);
  Future<List<RoundModel>> getActiveRounds(String neighborhoodId);
  Future<List<OrderModel>> getMyOrders();
  Future<List<NeighborhoodModel>> getNeighborhoods();
  Future<RoundModel> getRoundDetails(String roundId);
  Future<OrderModel> placeOrder(Map<String, dynamic> orderData);
  Future<void> rejectOrder(String orderId);
}

class RemoteDataSource implements IRemoteDataSource {
  final Dio _dio;

  RemoteDataSource(this._dio);

  @override
  Future<void> confirmPrice(String orderId) async {
    await _dio.post(ApiEndpoints.confirmOrder(orderId));
  }

  @override
  Future<List<RoundModel>> getActiveRounds(String neighborhoodId) async {
    final response = await _dio.get(ApiEndpoints.activeRounds(neighborhoodId));
    return (response.data as List).map((e) => RoundModel.fromJson(e)).toList();
  }

  @override
  Future<List<OrderModel>> getMyOrders() async {
    final response = await _dio.get(ApiEndpoints.myOrders);
    final data = response.data;
    if (data == null) return [];
    if (data is! List) {
      print(
        'Unexpected response type for myOrders: ${data.runtimeType} - $data',
      );
      throw Exception('Expected List but got ${data.runtimeType}');
    }

    final List<OrderModel> orders = [];
    for (int i = 0; i < data.length; i++) {
      try {
        orders.add(OrderModel.fromJson(data[i] as Map<String, dynamic>));
      } catch (e, stack) {
        print('Error parsing order at index $i:');
        print('Order data: ${data[i]}');
        print('Error: $e');
        print('Stack: $stack');
        rethrow;
      }
    }
    return orders;
  }

  @override
  Future<List<NeighborhoodModel>> getNeighborhoods() async {
    final response = await _dio.get(ApiEndpoints.neighborhoods);
    return (response.data as List)
        .map((e) => NeighborhoodModel.fromJson(e))
        .toList();
  }

  @override
  Future<RoundModel> getRoundDetails(String roundId) async {
    final response = await _dio.get(ApiEndpoints.roundDetails(roundId));
    return RoundModel.fromJson(response.data);
  }

  @override
  Future<OrderModel> placeOrder(Map<String, dynamic> orderData) async {
    final response = await _dio.post(ApiEndpoints.orders, data: orderData);
    return OrderModel.fromJson(response.data);
  }

  @override
  Future<void> rejectOrder(String orderId) async {
    await _dio.post(ApiEndpoints.rejectOrder(orderId));
  }
}
