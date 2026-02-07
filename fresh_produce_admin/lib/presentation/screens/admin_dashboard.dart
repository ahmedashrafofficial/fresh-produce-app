import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../l10n/app_localizations.dart';
import '../providers/auth_provider.dart';
import 'inventory_screen.dart';
import 'orders_screen.dart';
import 'rounds_screen.dart';

class AdminDashboard extends ConsumerStatefulWidget {
  const AdminDashboard({super.key});

  @override
  ConsumerState<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends ConsumerState<AdminDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    if (isMobile) {
      return Scaffold(
        body: _buildPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.inventory),
              label: l10n.products,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.sync),
              label: l10n.rounds,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: l10n.orders,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(l10n.adminPanel),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.red),
              onPressed: () => ref.read(adminAuthProvider.notifier).logout(),
            ),
          ],
        ),
      );
    }

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
