import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/admin_auth_model.dart';

class AdminAuthNotifier extends Notifier<AdminAuthModel?> {
  static const _authKey = 'admin_auth';

  @override
  AdminAuthModel? build() {
    _loadSession();
    return null;
  }

  Future<void> login(String token, String refreshToken) async {
    final auth = AdminAuthModel(token: token, refreshToken: refreshToken);
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
        state = AdminAuthModel.fromJson(jsonDecode(data));
      } catch (e) {
        prefs.remove(_authKey);
      }
    }
  }
}
