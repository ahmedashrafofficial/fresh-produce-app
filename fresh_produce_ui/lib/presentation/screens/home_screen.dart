import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/round.dart';
import '../providers/ui_providers.dart';
import '../widgets/round_card.dart';

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
            indicatorColor: const Color(0xFF2D6A4F),
            labelColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedLabelColor: Colors.grey,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.location_on_outlined),
              onPressed: () => context.go('/select-neighborhood'),
            ),
            IconButton(
              icon: Icon(
                ref.watch(authProvider) != null ? Icons.person : Icons.login,
                color: ref.watch(authProvider) != null ? Colors.white : null,
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
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            title: Text(l10n.logout),
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
                _RoundsList(
                  rounds: allRounds,
                  emptyMessage: l10n.noRoundsFound,
                ),
                _RoundsList(
                  rounds: openRounds,
                  emptyMessage: l10n.noRoundsOpen,
                ),
                _RoundsList(
                  rounds: pricingRounds,
                  emptyMessage: l10n.noRoundsPricing,
                ),
                _RoundsList(
                  rounds: deliveryRounds,
                  emptyMessage: l10n.noRoundsDelivery,
                ),
                _RoundsList(
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
          label: Text(l10n.myOrders),
          icon: const Icon(Icons.shopping_bag_outlined),
          backgroundColor: const Color(0xFF2D6A4F),
        ),
      ),
    );
  }
}

class _RoundsList extends StatelessWidget {
  final List<Round> rounds;
  final String emptyMessage;

  const _RoundsList({required this.rounds, required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    if (rounds.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            emptyMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rounds.length,
      itemBuilder: (context, index) {
        final round = rounds[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: RoundCard(
            round: round,
            onTap: () => context.push('/round/${round.id}'),
          ),
        );
      },
    );
  }
}
