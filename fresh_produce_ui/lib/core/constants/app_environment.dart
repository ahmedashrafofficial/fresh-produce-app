abstract class AppEnvironment {
  // API Base URLs
  static const String developmentApiUrl = 'http://localhost:5000';

  static const String productionApiUrl =
      'https://YOUR_AZURE_APP.azurewebsites.net';
  // Current Environment
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');

  // App Configuration
  static const String appName = 'Fresh Produce';

  static const String appVersion = '1.0.0';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static String get addressesEndpoint => '$apiBaseUrl/addresses';
  // API Endpoints
  static String get apiBaseUrl => '$apiUrl/api';
  // Get the appropriate API URL based on environment
  static String get apiUrl =>
      isProduction ? productionApiUrl : developmentApiUrl;
  static String get authEndpoint => '$apiBaseUrl/auth';
  static String get cartEndpoint => '$apiBaseUrl/cart';

  static String get categoriesEndpoint => '$apiBaseUrl/categories';
  static String get ordersEndpoint => '$apiBaseUrl/orders';

  static String get productsEndpoint => '$apiBaseUrl/products';
  AppEnvironment._();
}
