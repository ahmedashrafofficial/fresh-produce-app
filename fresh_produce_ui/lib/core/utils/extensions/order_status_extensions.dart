import '../../../domain/entities/order_status.dart';
import '../../../l10n/app_localizations.dart';

extension OrderStatusHelper on OrderStatus {
  String getLabel(AppLocalizations l10n) {
    switch (this) {
      case OrderStatus.placed:
        return l10n.statusPlaced;
      case OrderStatus.awaitingConfirmation:
        return l10n.statusAwaitingConfirmation;
      case OrderStatus.confirmed:
        return l10n.statusConfirmed;
      case OrderStatus.rejected:
        return l10n.statusRejected;
      case OrderStatus.paid:
        return l10n.statusPaid;
      case OrderStatus.delivered:
        return l10n.statusDelivered;
      case OrderStatus.cancelled:
        return l10n.statusCancelled;
    }
  }
}
