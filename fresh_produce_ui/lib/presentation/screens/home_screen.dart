import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_text_styles.dart';
import '../../core/utils/responsive_utils.dart';
import '../../domain/entities/round_status.dart';
import '../../l10n/app_localizations.dart';
import '../providers/ui_providers.dart';
import '../widgets/rounds_list_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoundsAsync = ref.watch(activeRoundsProvider);
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.produceRounds),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: l10n.all),
              Tab(text: l10n.open),
              Tab(text: l10n.pricing),
              Tab(text: l10n.deliveryPhase),
              Tab(text: l10n.done),
            ],
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Theme.of(
              context,
            ).colorScheme.onPrimary.withValues(alpha: 0.7),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.location_on_outlined,
                size: ResponsiveUtils.iconSize(context, 24),
              ),
              onPressed: () => context.go('/select-neighborhood'),
            ),
            IconButton(
              icon: Icon(
                ref.watch(authProvider) != null ? Icons.person : Icons.login,
                size: ResponsiveUtils.iconSize(context, 24),
              ),
              onPressed: () {
                if (ref.read(authProvider) != null) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Theme.of(context).colorScheme.error,
                              size: ResponsiveUtils.iconSize(context, 24),
                            ),
                            title: Text(
                              l10n.logout,
                              style: AppTextStyles.responsiveBodyLarge(context),
                            ),
                            onTap: () {
                              ref.read(authProvider.notifier).logout();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  context.push('/login');
                }
              },
            ),
          ],
        ),
        body: activeRoundsAsync.when(
          data: (rounds) {
            final allRounds = rounds;
            final openRounds = rounds
                .where((r) => r.status == RoundStatus.open)
                .toList();
            final pricingRounds = rounds
                .where(
                  (r) =>
                      r.status == RoundStatus.locked ||
                      r.status == RoundStatus.finished,
                )
                .toList();
            final deliveryRounds = rounds
                .where((r) => r.status == RoundStatus.delivering)
                .toList();
            final doneRounds = rounds
                .where(
                  (r) =>
                      r.status == RoundStatus.delivered ||
                      r.status == RoundStatus.completed ||
                      r.status == RoundStatus.cancelled,
                )
                .toList();

            return TabBarView(
              children: [
                RoundsListWidget(
                  rounds: allRounds,
                  emptyMessage: l10n.noRoundsFound,
                ),
                RoundsListWidget(
                  rounds: openRounds,
                  emptyMessage: l10n.noRoundsOpen,
                ),
                RoundsListWidget(
                  rounds: pricingRounds,
                  emptyMessage: l10n.noRoundsPricing,
                ),
                RoundsListWidget(
                  rounds: deliveryRounds,
                  emptyMessage: l10n.noRoundsDelivery,
                ),
                RoundsListWidget(
                  rounds: doneRounds,
                  emptyMessage: l10n.noHistoryFound,
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push('/my-orders'),
          label: Text(
            l10n.myOrders,
            style: AppTextStyles.responsiveLabel(context),
          ),
          icon: Icon(
            Icons.shopping_bag_outlined,
            size: ResponsiveUtils.iconSize(context, 24),
          ),
        ),
      ),
    );
  }
}
