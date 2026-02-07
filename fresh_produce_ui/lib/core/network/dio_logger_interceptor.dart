import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Provides a configured Dio logger interceptor for debugging network requests
abstract class DioLoggerInterceptor {
  DioLoggerInterceptor._();

  /// Creates a logger interceptor for Dio using built-in LogInterceptor
  /// Only logs in debug mode to avoid performance issues in production
  static LogInterceptor create() {
    return LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (object) {
        // Only log in debug mode
        if (kDebugMode) {
          log(object.toString());
        }
      },
    );
  }
}
