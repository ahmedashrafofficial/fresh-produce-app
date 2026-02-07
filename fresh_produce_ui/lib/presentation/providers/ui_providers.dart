import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/api_endpoints.dart';
import '../../core/network/dio_logger_interceptor.dart';
import '../../data/data_sources/remote_data_source.dart';
import '../../data/models/auth_model.dart';
import '../../data/repositories/repository_impl.dart';
import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/round.dart';
import '../../domain/repositories/repository_interface.dart';
import 'auth_notifier.dart';
import 'cart_notifier.dart';
import 'selected_neighborhood_notifier.dart';

final activeRoundsProvider = FutureProvider<List<Round>>((ref) async {
  final neighborhoodId = ref.watch(selectedNeighborhoodIdProvider);
  if (neighborhoodId == null) return [];
  return ref.watch(repositoryProvider).getActiveRounds(neighborhoodId);
});

final authProvider = NotifierProvider<AuthNotifier, AuthModel?>(() {
  return AuthNotifier();
});

final cartProvider = NotifierProvider<CartNotifier, Map<String, double>>(() {
  return CartNotifier();
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  // Add logger interceptor (first to log everything)
  dio.interceptors.add(DioLoggerInterceptor.create());

  // Add interceptor to dynamically add auth token to every request
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final auth = ref.read(authProvider);
        if (auth != null) {
          options.headers['Authorization'] = 'Bearer ${auth.token}';
        }
        return handler.next(options);
      },
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          ref.read(authProvider.notifier).logout();
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
});

final myOrdersProvider = FutureProvider<List<Order>>((ref) async {
  return ref.watch(repositoryProvider).getMyOrders();
});

final neighborhoodsProvider = FutureProvider<List<Neighborhood>>((ref) async {
  return ref.watch(repositoryProvider).getNeighborhoods();
});

final remoteDataSourceProvider = Provider<IRemoteDataSource>((ref) {
  return RemoteDataSource(ref.watch(dioProvider));
});

final repositoryProvider = Provider<IRepository>((ref) {
  return RepositoryImpl(ref.watch(remoteDataSourceProvider));
});

final selectedNeighborhoodIdProvider =
    NotifierProvider<SelectedNeighborhoodNotifier, String?>(() {
      return SelectedNeighborhoodNotifier();
    });
