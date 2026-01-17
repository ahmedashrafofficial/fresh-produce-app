import 'package:flutter/material.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/round.dart';

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
                      _getStatusLabel(l10n, round.status).toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color:
                            (round.status.index >= 2 && round.status.index <= 6)
                            ? Colors.green.shade700
                            : Colors.blue.shade700,
                      ),
                    ),
                    visualDensity: VisualDensity.compact,
                    backgroundColor:
                        (round.status.index >= 2 && round.status.index <= 6)
                        ? Colors.green.shade100
                        : Colors.blue.shade100,
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
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    l10n.leftLabel(
                                      p.remainingKg.toStringAsFixed(0),
                                      l10n.kg,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              LinearProgressIndicator(
                                value: p.progress,
                                backgroundColor: Colors.grey.shade200,
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

  String _getStatusLabel(AppLocalizations l10n, RoundStatus status) {
    switch (status) {
      case RoundStatus.open:
        return l10n.roundStatusOpen;
      case RoundStatus.locked:
        return l10n.roundStatusLocked;
      case RoundStatus.finished:
        return l10n.roundStatusFinished;
      case RoundStatus.delivering:
        return l10n.roundStatusDelivering;
      case RoundStatus.delivered:
        return l10n.roundStatusDelivered;
      case RoundStatus.completed:
        return l10n.roundStatusCompleted;
      case RoundStatus.cancelled:
        return l10n.roundStatusCancelled;
      default:
        return status.name;
    }
  }
}
