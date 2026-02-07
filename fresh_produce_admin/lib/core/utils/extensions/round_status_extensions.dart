import '../../../domain/entities/round_status.dart';
import '../../../l10n/app_localizations.dart';

extension RoundStatusHelper on RoundStatus {
  String getLabel(AppLocalizations l10n) {
    switch (this) {
      case RoundStatus.draft:
        return 'Draft';
      case RoundStatus.open:
        return l10n.open;
      case RoundStatus.locked:
        return l10n.pricing;
      case RoundStatus.finished:
        return l10n.pricing; // In admin pricing == locked/finished
      case RoundStatus.delivering:
        return l10n.delivery;
      case RoundStatus.delivered:
        return l10n.done;
      case RoundStatus.completed:
        return l10n.done;
      case RoundStatus.cancelled:
        return l10n.roundStatusCancelled;
    }
  }
}
