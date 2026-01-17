import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

class ApiEndpoints {
  // Auth (Using AccountController)
  static const String login = '/api/Account/login';

  static const String register = '/api/Account/register';
  // Neighborhoods
  static const String neighborhoods = '/api/Neighborhoods';

  // Products
  static const String products = '/api/Products';

  // Rounds
  static const String rounds = '/api/Rounds';

  // Orders
  static const String orders = '/api/Orders';
  static const String myOrders = '/api/Orders/my';
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:5252';
    if (Platform.isAndroid) return 'http://10.0.2.2:5252';
    return 'http://localhost:5252';
  }

  static String activeRounds(String neighborhoodId) =>
      '/api/Rounds/active/$neighborhoodId';
  static String confirmOrder(String id) => '/api/Orders/$id/confirm';
  static String rejectOrder(String id) => '/api/Orders/$id/reject';
  static String roundDetails(String roundId) => '/api/Rounds/$roundId';
}
