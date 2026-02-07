import 'package:flutter/material.dart';

import '../../core/utils/extensions/order_status_extensions.dart';
import '../../domain/entities/order_status.dart';
import '../../l10n/app_localizations.dart';

class StatusChip extends StatelessWidget {
  final OrderStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Color color;
    switch (status) {
      case OrderStatus.placed:
        color = Colors.blue;
        break;
      case OrderStatus.awaitingConfirmation:
        color = Colors.orange;
        break;
      case OrderStatus.confirmed:
        color = Colors.cyan;
        break;
      case OrderStatus.rejected:
        color = Colors.redAccent;
        break;
      case OrderStatus.paid:
        color = const Color(0xFF2D6A4F);
        break;
      case OrderStatus.delivered:
        color = Colors.purple;
        break;
      case OrderStatus.cancelled:
        color = Colors.grey;
        break;
    }

    return Chip(
      label: Text(
        status.getLabel(l10n).toUpperCase(),
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
