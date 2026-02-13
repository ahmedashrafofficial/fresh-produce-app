import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/api_endpoints.dart';
import '../../core/constants/app_colors.dart';
import '../providers/ui_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.register)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.createAccount,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: l10n.fullName,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: l10n.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_outlined),
                  hintText: '01xxxxxxxxx',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address (Optional)',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  hintText: 'Your delivery address',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: l10n.password,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _register,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: _isLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(l10n.register),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.pop(),
                child: Text(l10n.login),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _register() async {
    setState(() => _isLoading = true);
    try {
      final dio = ref.read(dioProvider);
      await dio.post(
        ApiEndpoints.register,
        data: {
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
          'fullName': _fullNameController.text.trim(),
          'phoneNumber': _phoneController.text.trim(),
          'address': _addressController.text.trim(),
        },
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful! Please login.'),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
