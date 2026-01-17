import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final adminAuthProvider = NotifierProvider<AdminAuthNotifier, AdminAuth?>(() {
  return AdminAuthNotifier();
});

class AdminAuth {
  final String token;
  final String refreshToken;

  AdminAuth({required this.token, required this.refreshToken});

  factory AdminAuth.fromJson(Map<String, dynamic> json) =>
      AdminAuth(token: json['token'], refreshToken: json['refreshToken']);

  Map<String, dynamic> toJson() => {
    'token': token,
    'refreshToken': refreshToken,
  };
}

class AdminAuthNotifier extends Notifier<AdminAuth?> {
  static const _authKey = 'admin_auth';

  @override
  AdminAuth? build() {
    _loadSession();
    return null;
  }

  Future<void> login(String token, String refreshToken) async {
    final auth = AdminAuth(token: token, refreshToken: refreshToken);
    state = auth;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authKey, jsonEncode(auth.toJson()));
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
        state = AdminAuth.fromJson(jsonDecode(data));
      } catch (e) {
        prefs.remove(_authKey);
      }
    }
  }
}
