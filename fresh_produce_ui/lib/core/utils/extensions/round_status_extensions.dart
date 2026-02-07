import '../../../domain/entities/round_status.dart';
import '../../../l10n/app_localizations.dart';

extension RoundStatusHelper on RoundStatus {
  String getLabel(AppLocalizations l10n) {
    switch (this) {
      case RoundStatus.draft:
        return 'Draft';
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
    }
  }
}
