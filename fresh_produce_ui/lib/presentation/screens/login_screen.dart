import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/api_endpoints.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/models/auth_model.dart';
import '../providers/ui_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirectTo;

  const LoginScreen({super.key, this.redirectTo});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.login)),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveUtils.padding(context, 24)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.welcomeBack,
                style: AppTextStyles.responsiveH2(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ResponsiveUtils.height(context, 32)),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: l10n.email,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: ResponsiveUtils.iconSize(context, 24),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: ResponsiveUtils.height(context, 16)),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: ResponsiveUtils.iconSize(context, 24),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: ResponsiveUtils.height(context, 8)),
              CheckboxListTile(
                value: _rememberMe,
                onChanged: (val) => setState(() => _rememberMe = val!),
                title: Text(
                  l10n.rememberMe,
                  style: AppTextStyles.responsiveBodyMedium(context),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              SizedBox(height: ResponsiveUtils.height(context, 16)),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    ResponsiveUtils.height(context, 56),
                  ),
                ),
                child: _isLoading
                    ? SizedBox(
                        height: ResponsiveUtils.height(context, 24),
                        width: ResponsiveUtils.width(context, 24),
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        l10n.login,
                        style: AppTextStyles.responsiveLabel(context),
                      ),
              ),
              SizedBox(height: ResponsiveUtils.height(context, 16)),
              TextButton(
                onPressed: () => context.push('/register'),
                child: Text(
                  l10n.dontHaveAccount,
                  style: AppTextStyles.responsiveBodyMedium(context),
                ),
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
      final dio = ref.read(dioProvider);
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
        },
      );

      final data = response.data;
      final authModel = AuthModel(
        token: data['token'],
        refreshToken: data['refreshToken'] ?? '',
        userId: data['user']['id'],
      );

      await ref.read(authProvider.notifier).login(authModel);
      if (mounted) context.go(widget.redirectTo ?? '/');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
