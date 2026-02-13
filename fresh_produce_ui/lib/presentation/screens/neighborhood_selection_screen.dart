import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:fresh_produce_ui/presentation/providers/ui_providers.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/responsive_utils.dart';

class NeighborhoodSelectionScreen extends ConsumerWidget {
  const NeighborhoodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final neighborhoodsAsync = ref.watch(neighborhoodsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: ResponsiveUtils.height(context, 60)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.padding(context, 24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.welcomeTo,
                      style: AppTextStyles.responsiveH3(
                        context,
                      ).copyWith(color: AppColors.white.withValues(alpha: 0.7)),
                    ),
                    Text(
                      l10n.appTitle,
                      style: AppTextStyles.responsiveH1(context).copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: ResponsiveUtils.height(context, 16)),
                    Text(
                      l10n.chooseNeighborhoodNotice,
                      style: AppTextStyles.responsiveBodyLarge(
                        context,
                      ).copyWith(color: AppColors.white.withValues(alpha: 0.6)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      ResponsiveUtils.radius(context, 32),
                    ),
                    topRight: Radius.circular(
                      ResponsiveUtils.radius(context, 32),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(ResponsiveUtils.padding(context, 32)),
                child: neighborhoodsAsync.when(
                  data: (neighborhoods) => Column(
                    children: [
                      ...neighborhoods.map(
                        (n) => Padding(
                          padding: EdgeInsets.only(
                            bottom: ResponsiveUtils.padding(context, 16),
                          ),
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(selectedNeighborhoodIdProvider.notifier)
                                  .select(n.id);
                              context.go('/');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveUtils.padding(
                                  context,
                                  20,
                                ),
                                vertical: ResponsiveUtils.padding(context, 24),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveUtils.radius(context, 24),
                                ),
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.08),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: 0.04),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                      ResponsiveUtils.padding(context, 12),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(
                                        ResponsiveUtils.radius(context, 16),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      size: ResponsiveUtils.iconSize(
                                        context,
                                        28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ResponsiveUtils.width(context, 20),
                                  ),
                                  Expanded(
                                    child: Text(
                                      n.name,
                                      style: AppTextStyles.responsiveH3(context)
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: ResponsiveUtils.iconSize(context, 16),
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: 0.3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, s) =>
                      Center(child: Text(l10n.error(e.toString()))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
