class ApiEndpoints {
  static const String baseUrl = 'http://localhost:5252';

  // Auth (Using AccountController)
  static const String login = '/api/Account/login';

  // Neighborhoods
  static const String neighborhoods = '/api/Neighborhoods';

  // Products
  static const String products = '/api/Products';

  // Rounds
  static const String rounds = '/api/Rounds/admin/all';
  static const String createRound = '/api/Rounds/admin';
  // Orders
  static const String orders = '/api/Orders/admin/all';

  static String updateOrderStatus(String orderId) =>
      '/api/Orders/$orderId/status';
  static String updateRound(String id) => '/api/Rounds/admin/$id';
}
