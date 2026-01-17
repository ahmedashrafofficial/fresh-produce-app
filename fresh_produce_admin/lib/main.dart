import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_admin/l10n/app_localizations.dart';

import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/inventory_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/orders_screen.dart';
import 'presentation/screens/rounds_screen.dart';

void main() {
  runApp(const ProviderScope(child: FreshProduceAdminApp()));
}

class AdminDashboard extends ConsumerStatefulWidget {
  const AdminDashboard({super.key});

  @override
  ConsumerState<AdminDashboard> createState() => _AdminDashboardState();
}

class FreshProduceAdminApp extends ConsumerWidget {
  const FreshProduceAdminApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(adminAuthProvider);

    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.adminPanel,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      locale: const Locale('ar'),
      home: auth != null ? const AdminDashboard() : const LoginScreen(),
    );
  }
}

class _AdminDashboardState extends ConsumerState<AdminDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() => _selectedIndex = index);
            },
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () => ref.read(adminAuthProvider.notifier).logout(),
              ),
            ),
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.inventory),
                label: Text(l10n.products),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.sync),
                label: Text(l10n.rounds),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.shopping_cart),
                label: Text(l10n.orders),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _buildPage()),
        ],
      ),
    );
  }

  Widget _buildPage() {
    switch (_selectedIndex) {
      case 0:
        return const InventoryScreen();
      case 1:
        return const RoundsScreen();
      case 2:
        return const OrdersScreen();
      default:
        return const Center(child: Text('Error'));
    }
  }
}
