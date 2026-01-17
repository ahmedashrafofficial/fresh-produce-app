import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:fresh_produce_ui/presentation/providers/ui_providers.dart';
import 'package:go_router/go_router.dart';

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
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.welcomeTo,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: Colors.white70),
                    ),
                    Text(
                      l10n.appTitle,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.chooseNeighborhoodNotice,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.white60),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.all(32),
                child: neighborhoodsAsync.when(
                  data: (neighborhoods) => Column(
                    children: [
                      ...neighborhoods.map(
                        (n) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              ref
                                  .read(selectedNeighborhoodIdProvider.notifier)
                                  .select(n.id);
                              context.go('/');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xFF2D6A4F),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    n.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios, size: 16),
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
