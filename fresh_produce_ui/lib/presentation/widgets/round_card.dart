import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/extensions/round_product_extensions.dart';
import '../../core/utils/extensions/round_status_extensions.dart';
import '../../core/utils/responsive_utils.dart';
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
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtils.padding(context, 16),
                vertical: ResponsiveUtils.padding(context, 8),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: ResponsiveUtils.iconSize(context, 16),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: ResponsiveUtils.width(context, 8)),
                  Text(
                    '${l10n.ends} $endDateStr',
                    style: AppTextStyles.responsiveBodySmall(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      round.status.getLabel(l10n).toUpperCase(),
                      style: AppTextStyles.responsiveBodySmall(context)
                          .copyWith(
                            fontSize: ResponsiveUtils.fontSize(context, 10),
                            fontWeight: FontWeight.bold,
                            color:
                                (round.status.index >= 2 &&
                                    round.status.index <= 6)
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    visualDensity: VisualDensity.compact,
                    backgroundColor:
                        (round.status.index >= 2 && round.status.index <= 6)
                        ? Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1)
                        : Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ResponsiveUtils.padding(context, 16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    round.roundNumber > 0
                        ? '${l10n.roundHash}${round.roundNumber}'
                        : '${l10n.roundHash}${round.id.substring(0, 8).toUpperCase()}',
                    style: AppTextStyles.responsiveH3(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: ResponsiveUtils.height(context, 8)),
                  const Divider(),
                  SizedBox(height: ResponsiveUtils.height(context, 8)),
                  ...round.products
                      .take(2)
                      .map(
                        (p) => Padding(
                          padding: EdgeInsets.only(
                            bottom: ResponsiveUtils.padding(context, 8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${p.product?.name ?? 'Product'} (${l10n.targetLabel(p.targetQuantityKg.toStringAsFixed(0), l10n.kg)})',
                                    style: AppTextStyles.responsiveBodySmall(
                                      context,
                                    ),
                                  ),
                                  Text(
                                    l10n.leftLabel(
                                      p.remainingKg.toStringAsFixed(0),
                                      l10n.kg,
                                    ),
                                    style: AppTextStyles.responsiveBodySmall(
                                      context,
                                    ).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ResponsiveUtils.height(context, 4),
                              ),
                              LinearProgressIndicator(
                                value: p.progress,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveUtils.radius(context, 4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  if (round.products.length > 2)
                    Text(
                      l10n.moreItems(round.products.length - 2),
                      style: AppTextStyles.responsiveBodySmall(context)
                          .copyWith(
                            color: AppColors.grey,
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
