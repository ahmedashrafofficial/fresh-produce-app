import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart'
    hide ResponsiveUtils;

import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../domain/entities/round.dart';
import 'round_card.dart';

class RoundsListWidget extends StatelessWidget {
  final List<Round> rounds;
  final String emptyMessage;

  const RoundsListWidget({
    super.key,
    required this.rounds,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (rounds.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(ResponsiveUtils.padding(context, 32.0)),
          child: Text(
            emptyMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.responsiveBodyMedium(context).copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      );
    }

    return ResponsiveGridView.builder(
      padding: EdgeInsets.all(ResponsiveUtils.padding(context, 16)),
      itemCount: rounds.length,
      gridDelegate: ResponsiveGridDelegate(
        crossAxisSpacing: ResponsiveUtils.padding(context, 16),
        mainAxisSpacing: ResponsiveUtils.padding(context, 16),
        maxCrossAxisExtent: ResponsiveUtils.width(context, 450),
      ),
      itemBuilder: (context, index) {
        final round = rounds[index];
        return RoundCard(
          round: round,
          onTap: () => context.push('/round/${round.id}'),
        );
      },
    );
  }
}
