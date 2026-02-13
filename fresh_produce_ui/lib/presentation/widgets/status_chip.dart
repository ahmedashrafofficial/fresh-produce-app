import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/extensions/order_status_extensions.dart';
import '../../core/utils/responsive_utils.dart';
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
        color = AppColors.info;
        break;
      case OrderStatus.awaitingConfirmation:
        color = AppColors.warning;
        break;
      case OrderStatus.confirmed:
        color = AppColors.primaryLight;
        break;
      case OrderStatus.rejected:
        color = AppColors.error;
        break;
      case OrderStatus.paid:
        color = AppColors.success;
        break;
      case OrderStatus.delivered:
        color = AppColors.accent;
        break;
      case OrderStatus.cancelled:
        color = AppColors.neutral;
        break;
    }

    return Chip(
      label: Text(
        status.getLabel(l10n).toUpperCase(),
        style: AppTextStyles.responsiveBodySmall(context).copyWith(
          fontSize: ResponsiveUtils.fontSize(context, 10),
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
