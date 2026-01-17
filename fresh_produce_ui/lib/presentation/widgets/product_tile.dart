import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';

import '../../domain/entities/round.dart';
import '../providers/ui_providers.dart';

class ProductTile extends ConsumerWidget {
  final RoundProduct roundProduct;

  const ProductTile({super.key, required this.roundProduct});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final cart = ref.watch(cartProvider);
    final quantity = cart[roundProduct.productId] ?? 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                image: roundProduct.product?.imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(roundProduct.product!.imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: roundProduct.product?.imageUrl == null
                  ? const Icon(Icons.eco, color: Color(0xFF2D6A4F), size: 40)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roundProduct.product?.name ?? 'Product',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (roundProduct.actualCustomerPrice == null ||
                      roundProduct.actualCustomerPrice !=
                          roundProduct.estimatedCustomerPrice)
                    Text(
                      l10n.est(
                        roundProduct.estimatedCustomerPrice.toStringAsFixed(2),
                        l10n.egp,
                        roundProduct.product?.unit ?? l10n.kg,
                      ),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        decoration: roundProduct.actualCustomerPrice != null
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: roundProduct.actualCustomerPrice != null
                            ? 11
                            : 14,
                      ),
                    ),
                  if (roundProduct.actualCustomerPrice != null)
                    Text(
                      l10n.marketPrice(
                        roundProduct.actualCustomerPrice!.toStringAsFixed(2),
                        l10n.egp,
                      ),
                      style: const TextStyle(
                        color: Color(0xFF2D6A4F),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: roundProduct.progress,
                    backgroundColor: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                    minHeight: 6,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.percentageFilled(
                          (roundProduct.progress * 100).toInt(),
                        ),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        l10n.leftLabel(
                          roundProduct.remainingKg.toStringAsFixed(1),
                          l10n.kg,
                        ),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D6A4F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xFF2D6A4F),
                      ),
                      onPressed: quantity > 0
                          ? () => ref
                                .read(cartProvider.notifier)
                                .update(roundProduct.productId, quantity - 1.0)
                          : null,
                    ),
                    Text(
                      '${quantity.toInt()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFF2D6A4F),
                      ),
                      onPressed: () => ref
                          .read(cartProvider.notifier)
                          .update(roundProduct.productId, quantity + 1.0),
                    ),
                  ],
                ),
                Text(
                  roundProduct.product?.unit ?? l10n.kg,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
