import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/api_endpoints.dart';
import '../../data/data_sources/remote_data_source.dart';
import '../../data/repositories/repository_impl.dart';
import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/round.dart';
import '../../domain/repositories/repository_interface.dart';

final activeRoundsProvider = FutureProvider<List<Round>>((ref) async {
  final neighborhoodId = ref.watch(selectedNeighborhoodIdProvider);
  if (neighborhoodId == null) return [];
  return ref.watch(repositoryProvider).getActiveRounds(neighborhoodId);
});

final authProvider = NotifierProvider<AuthNotifier, AuthData?>(() {
  return AuthNotifier();
});

final cartProvider = NotifierProvider<CartNotifier, Map<String, double>>(() {
  return CartNotifier();
});

// --- Providers ---

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  final auth = ref.watch(authProvider);
  if (auth != null) {
    dio.options.headers['Authorization'] = 'Bearer ${auth.token}';
  }

  dio.interceptors.add(
    InterceptorsWrapper(
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

// Future Providers
final neighborhoodsProvider = FutureProvider<List<Neighborhood>>((ref) async {
  return ref.watch(repositoryProvider).getNeighborhoods();
});

final remoteDataSourceProvider = Provider<IRemoteDataSource>((ref) {
  return RemoteDataSource(ref.watch(dioProvider));
});

final repositoryProvider = Provider<IRepository>((ref) {
  return RepositoryImpl(ref.watch(remoteDataSourceProvider));
});

// State Notifiers
final selectedNeighborhoodIdProvider =
    NotifierProvider<SelectedNeighborhoodNotifier, String?>(() {
      return SelectedNeighborhoodNotifier();
    });

// --- Auth Model (Simplified for internal use) ---
class AuthData {
  final String token;
  final String refreshToken;
  final String userId;

  AuthData({
    required this.token,
    required this.refreshToken,
    required this.userId,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
    token: json['token'],
    refreshToken: json['refreshToken'],
    userId: json['userId'],
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'refreshToken': refreshToken,
    'userId': userId,
  };
}

class AuthNotifier extends Notifier<AuthData?> {
  static const _authKey = 'auth_data';

  @override
  AuthData? build() {
    _loadSession();
    return null;
  }

  Future<void> login(AuthData data) async {
    state = data;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authKey, jsonEncode(data.toJson()));
  }

  Future<void> logout() async {
    state = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
  }

  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_authKey);
    if (data != null) {
      try {
        state = AuthData.fromJson(jsonDecode(data));
      } catch (e) {
        prefs.remove(_authKey);
      }
    }
  }
}

class CartNotifier extends Notifier<Map<String, double>> {
  @override
  Map<String, double> build() => {};

  void clear() => state = {};

  void update(String productId, double quantity) {
    if (quantity <= 0) {
      state = {...state}..remove(productId);
    } else {
      state = {...state, productId: quantity};
    }
  }
}

class SelectedNeighborhoodNotifier extends Notifier<String?> {
  @override
  String? build() => null;
  void select(String? id) => state = id;
}
