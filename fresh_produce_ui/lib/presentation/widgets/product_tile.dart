import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/extensions/round_product_extensions.dart';
import '../../core/utils/responsive_utils.dart';
import '../../domain/entities/round_product.dart';
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
      margin: EdgeInsets.only(bottom: ResponsiveUtils.padding(context, 12)),
      child: Padding(
        padding: EdgeInsets.all(ResponsiveUtils.padding(context, 12)),
        child: Row(
          children: [
            Container(
              width: ResponsiveUtils.width(context, 80),
              height: ResponsiveUtils.height(context, 80),
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(
                  ResponsiveUtils.radius(context, 12),
                ),
                image: roundProduct.product?.imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(roundProduct.product!.imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: roundProduct.product?.imageUrl == null
                  ? Icon(
                      Icons.eco,
                      color: AppColors.primary,
                      size: ResponsiveUtils.iconSize(context, 40),
                    )
                  : null,
            ),
            SizedBox(width: ResponsiveUtils.width(context, 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roundProduct.product?.name ?? 'Product',
                    style: AppTextStyles.responsiveH3(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
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
                      style: AppTextStyles.responsiveBodyMedium(context)
                          .copyWith(
                            color: AppColors.textSecondaryLight,
                            decoration: roundProduct.actualCustomerPrice != null
                                ? TextDecoration.lineThrough
                                : null,
                            fontSize: roundProduct.actualCustomerPrice != null
                                ? ResponsiveUtils.fontSize(context, 11)
                                : ResponsiveUtils.fontSize(context, 14),
                          ),
                    ),
                  if (roundProduct.actualCustomerPrice != null)
                    Text(
                      l10n.marketPrice(
                        roundProduct.actualCustomerPrice!.toStringAsFixed(2),
                        l10n.egp,
                      ),
                      style: AppTextStyles.responsiveLabel(context).copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: ResponsiveUtils.height(context, 8)),
                  LinearProgressIndicator(
                    value: roundProduct.progress,
                    backgroundColor: AppColors.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(
                      ResponsiveUtils.radius(context, 4),
                    ),
                    minHeight: ResponsiveUtils.height(context, 6),
                  ),
                  SizedBox(height: ResponsiveUtils.height(context, 4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.percentageFilled(
                          (roundProduct.progress * 100).toInt(),
                        ),
                        style: AppTextStyles.responsiveBodySmall(
                          context,
                        ).copyWith(color: AppColors.grey),
                      ),
                      Text(
                        l10n.leftLabel(
                          roundProduct.remainingKg.toStringAsFixed(1),
                          l10n.kg,
                        ),
                        style: AppTextStyles.responsiveBodySmall(context)
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
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
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: AppColors.primary,
                        size: ResponsiveUtils.iconSize(context, 24),
                      ),
                      onPressed: quantity > 0
                          ? () => ref
                                .read(cartProvider.notifier)
                                .update(roundProduct.productId, quantity - 1.0)
                          : null,
                    ),
                    Text(
                      '${quantity.toInt()}',
                      style: AppTextStyles.responsiveBodyMedium(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: AppColors.primary,
                        size: ResponsiveUtils.iconSize(context, 24),
                      ),
                      onPressed: () => ref
                          .read(cartProvider.notifier)
                          .update(roundProduct.productId, quantity + 1.0),
                    ),
                  ],
                ),
                Text(
                  roundProduct.product?.unit ?? l10n.kg,
                  style: AppTextStyles.responsiveBodySmall(
                    context,
                  ).copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
