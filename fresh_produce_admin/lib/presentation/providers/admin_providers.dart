import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/api_endpoints.dart';
import '../../data/data_sources/admin_remote_data_source.dart';
import '../../data/repositories/admin_repository_impl.dart';
import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/round.dart';
import '../../domain/repositories/admin_repository.dart';
import 'auth_provider.dart';

final adminRemoteDataSourceProvider = Provider<IAdminRemoteDataSource>((ref) {
  return AdminRemoteDataSource(ref.watch(dioProvider));
});

final adminRepositoryProvider = Provider<IAdminRepository>((ref) {
  return AdminRepositoryImpl(ref.watch(adminRemoteDataSourceProvider));
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  final auth = ref.watch(adminAuthProvider);
  if (auth != null) {
    dio.options.headers['Authorization'] = 'Bearer ${auth.token}';
  }

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          ref.read(adminAuthProvider.notifier).logout();
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
});

final neighborhoodsProvider = FutureProvider<List<Neighborhood>>((ref) async {
  return ref.watch(adminRepositoryProvider).getNeighborhoods();
});

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  return ref.watch(adminRepositoryProvider).getOrders();
});

// Future Providers
final productsProvider = FutureProvider<List<Product>>((ref) async {
  return ref.watch(adminRepositoryProvider).getProducts();
});

final roundsProvider = FutureProvider<List<Round>>((ref) async {
  return ref.watch(adminRepositoryProvider).getRounds();
});
