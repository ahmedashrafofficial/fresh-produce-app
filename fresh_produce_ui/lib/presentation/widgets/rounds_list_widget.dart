import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          padding: const EdgeInsets.all(32.0),
          child: Text(
            emptyMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      );
    }

    return ResponsiveGridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: rounds.length,
      gridDelegate: const ResponsiveGridDelegate(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        maxCrossAxisExtent: 450,
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
