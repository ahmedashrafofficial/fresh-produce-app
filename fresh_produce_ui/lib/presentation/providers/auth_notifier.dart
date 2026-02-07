import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/auth_model.dart';

class AuthNotifier extends Notifier<AuthModel?> {
  static const _authKey = 'auth_data';

  @override
  AuthModel? build() {
    _loadSession();
    return null;
  }

  Future<void> login(AuthModel data) async {
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
        state = AuthModel.fromJson(jsonDecode(data));
      } catch (e) {
        prefs.remove(_authKey);
      }
    }
  }
}
