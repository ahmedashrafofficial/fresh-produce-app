import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/utils/extensions/round_product_extensions.dart';
import '../../core/utils/extensions/round_status_extensions.dart';
import '../../domain/entities/round.dart';
import '../../l10n/app_localizations.dart';

class RoundCard extends StatelessWidget {
  final Round round;
  final VoidCallback onTap;

  const RoundCard({super.key, required this.round, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final endDateStr = DateFormat('MMM dd, hh:mm a').format(round.endDate);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${l10n.ends} $endDateStr',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      round.status.getLabel(l10n).toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color:
                            (round.status.index >= 2 && round.status.index <= 6)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    visualDensity: VisualDensity.compact,
                    backgroundColor:
                        (round.status.index >= 2 && round.status.index <= 6)
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                        : Theme.of(
                            context,
                          ).colorScheme.secondary.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    round.roundNumber > 0
                        ? '${l10n.roundHash}${round.roundNumber}'
                        : '${l10n.roundHash}${round.id.substring(0, 8).toUpperCase()}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  ...round.products
                      .take(2)
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${p.product?.name ?? 'Product'} (${l10n.targetLabel(p.targetQuantityKg.toStringAsFixed(0), l10n.kg)})',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  Text(
                                    l10n.leftLabel(
                                      p.remainingKg.toStringAsFixed(0),
                                      l10n.kg,
                                    ),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              LinearProgressIndicator(
                                value: p.progress,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ),
                        ),
                      ),
                  if (round.products.length > 2)
                    Text(
                      l10n.moreItems(round.products.length - 2),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
