import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/extensions/round_product_extensions.dart';
import '../../core/utils/extensions/round_status_extensions.dart';
import '../providers/ui_providers.dart';
import '../widgets/product_tile.dart';

class RoundDetailsScreen extends ConsumerWidget {
  final String roundId;

  const RoundDetailsScreen({super.key, required this.roundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoundsAsync = ref.watch(activeRoundsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.roundDetails)),
      body: activeRoundsAsync.when(
        data: (rounds) {
          final round = rounds.firstWhere((r) => r.id == roundId);
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          round.roundNumber > 0
                              ? '${l10n.roundHash}${round.roundNumber}'
                              : '${l10n.roundHash}${round.id.substring(0, 8).toUpperCase()}',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.success.withValues(alpha: 0.1),
                            ),
                          ),
                          child: Text(
                            round.status.getLabel(l10n).toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color:
                                  (round.status.index >= 2 &&
                                      round.status.index <= 6)
                                  ? AppColors.success
                                  : AppColors.primaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: AppColors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${l10n.deadline}${round.endDate.toLocal().toString().split('.')[0]}',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.black.withValues(alpha: 0.87),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 32),
                    Text(
                      l10n.priceNotice,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.priceNoticeDetail,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.black.withValues(alpha: 0.87),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: round.products.length,
                  itemBuilder: (context, index) {
                    final product = round.products[index];
                    return ProductTile(roundProduct: product);
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final cart = ref.watch(cartProvider);
                      final bool hasItemsInRound = round.products.any(
                        (p) => cart.containsKey(p.productId),
                      );
                      final bool isClosed = round.status.index >= 2;

                      // Calculate total price for items in this round using actual price if available
                      double totalPrice = 0;
                      for (final product in round.products) {
                        if (cart.containsKey(product.productId)) {
                          final qty = cart[product.productId] ?? 0;
                          // Prefer actualCustomerPrice if set, otherwise fall back to estimatedCustomerPrice
                          final pricePerKg =
                              product.actualCustomerPrice ??
                              product.estimatedCustomerPrice;
                          totalPrice += qty * pricePerKg;
                        }
                      }
                      final totalAmount = totalPrice;

                      return ElevatedButton(
                        onPressed: (isClosed || !hasItemsInRound)
                            ? null
                            : () => context.push('/checkout/$roundId'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 56),
                        ),
                        child: Text(
                          isClosed
                              ? l10n.batchClosed
                              : !hasItemsInRound
                              ? l10n.addItemsToStart
                              : '${l10n.reviewOrderPayDeposit} - ${totalAmount.toStringAsFixed(2)} ${l10n.egp}',
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
      ),
    );
  }
}
