import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_admin/l10n/app_localizations.dart';

import '../../core/constants/api_endpoints.dart';
import '../../core/constants/app_dimensions.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Container(
          width: AppDimensions.loginCardWidth,
          padding: const EdgeInsets.all(AppDimensions.paddingXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.adminLogin,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppDimensions.spaceXL),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: l10n.email),
              ),
              const SizedBox(height: AppDimensions.spaceM),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: l10n.password),
                obscureText: true,
              ),
              const SizedBox(height: AppDimensions.spaceXL),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      AppDimensions.buttonHeight,
                    ),
                  ),
                  child: Text(l10n.login),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    setState(() => _isLoading = true);
    try {
      final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        await ref
            .read(adminAuthProvider.notifier)
            .login(data['token'], data['refreshToken'] ?? '');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
