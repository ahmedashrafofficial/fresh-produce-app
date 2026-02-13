import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_dimensions.dart';
import '../../core/constants/round_sort_option.dart';
import '../../core/utils/extensions/round_status_extensions.dart';
import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/round.dart';
import '../../domain/entities/round_product.dart';
import '../../domain/entities/round_status.dart';
import '../../l10n/app_localizations.dart';
import '../providers/admin_providers.dart';
import '../providers/auth_provider.dart';
import 'round_details_screen.dart';

class RoundsScreen extends ConsumerStatefulWidget {
  const RoundsScreen({super.key});

  @override
  ConsumerState<RoundsScreen> createState() => _RoundsScreenState();
}

class _RoundsScreenState extends ConsumerState<RoundsScreen> {
  RoundSortOption _selectedSortOption = RoundSortOption.startDate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final roundsAsync = ref.watch(roundsProvider);
    final neighborhoodsAsync = ref.watch(neighborhoodsProvider);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.roundsManagement),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                ref.read(adminAuthProvider.notifier).logout();
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: l10n.all),
                      Tab(text: l10n.open),
                      Tab(text: l10n.pricing),
                      Tab(text: l10n.delivery),
                      Tab(text: l10n.done),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingM,
                  ),
                  child: DropdownButton<RoundSortOption>(
                    value: _selectedSortOption,
                    icon: const Icon(Icons.sort),
                    dropdownColor: Theme.of(context).colorScheme.surface,
                    style: Theme.of(context).textTheme.bodyMedium,
                    items: [
                      DropdownMenuItem(
                        value: RoundSortOption.startDate,
                        child: Text(l10n.startDate),
                      ),
                      DropdownMenuItem(
                        value: RoundSortOption.endDate,
                        child: Text(l10n.endDate),
                      ),
                      DropdownMenuItem(
                        value: RoundSortOption.region,
                        child: Text(l10n.neighborhood),
                      ),
                    ],
                    onChanged: (RoundSortOption? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedSortOption = newValue;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: roundsAsync.when(
          data: (originalRounds) => neighborhoodsAsync.when(
            data: (neighborhoods) {
              List<Round> rounds = List.from(originalRounds);

              rounds.sort((a, b) {
                switch (_selectedSortOption) {
                  case RoundSortOption.startDate:
                    return b.startDate.compareTo(a.startDate);
                  case RoundSortOption.endDate:
                    return b.endDate.compareTo(a.endDate);
                  case RoundSortOption.region:
                    final nA = neighborhoods.firstWhere(
                      (n) => n.id == a.neighborhoodId,
                      orElse: () => Neighborhood(id: '', name: '', city: ''),
                    );
                    final nB = neighborhoods.firstWhere(
                      (n) => n.id == b.neighborhoodId,
                      orElse: () => Neighborhood(id: '', name: '', city: ''),
                    );
                    return nA.name.compareTo(nB.name);
                }
              });

              return TabBarView(
                children: [
                  _buildList(context, ref, rounds, neighborhoods),
                  _buildList(
                    context,
                    ref,
                    rounds.where((r) => r.status == RoundStatus.open).toList(),
                    neighborhoods,
                  ),
                  _buildList(
                    context,
                    ref,
                    rounds
                        .where(
                          (r) =>
                              r.status == RoundStatus.locked ||
                              r.status == RoundStatus.finished,
                        )
                        .toList(),
                    neighborhoods,
                  ),
                  _buildList(
                    context,
                    ref,
                    rounds
                        .where((r) => r.status == RoundStatus.delivering)
                        .toList(),
                    neighborhoods,
                  ),
                  _buildList(
                    context,
                    ref,
                    rounds
                        .where(
                          (r) =>
                              r.status == RoundStatus.delivered ||
                              r.status == RoundStatus.completed ||
                              r.status == RoundStatus.cancelled,
                        )
                        .toList(),
                    neighborhoods,
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showRoundDialog(context, ref),
          child: const Icon(Icons.add_circle_outline),
        ),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    WidgetRef ref,
    List<Round> rounds,
    List<Neighborhood> neighborhoods,
  ) {
    final l10n = AppLocalizations.of(context)!;
    if (rounds.isEmpty) return Center(child: Text(l10n.noRoundsFound));

    return ListView.builder(
      itemCount: rounds.length,
      itemBuilder: (context, index) {
        final r = rounds[index];
        final neighborhood = neighborhoods.firstWhere(
          (n) => n.id == r.neighborhoodId,
          orElse: () => Neighborhood(id: '', name: 'Unknown', city: ''),
        );

        return Card(
          margin: const EdgeInsets.all(AppDimensions.paddingS),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RoundDetailsScreen(round: r, neighborhood: neighborhood),
                ),
              );
            },
            title: Text(
              r.roundNumber > 0
                  ? '${l10n.roundPrefix} #${r.roundNumber} - ${neighborhood.name}'
                  : '${l10n.roundPrefix}${r.id.substring(0, 8).toUpperCase()} - ${neighborhood.name}',
            ),
            subtitle: Text('${l10n.status}: ${r.status.getLabel(l10n)}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _showRoundDialog(context, ref, r),
            ),
          ),
        );
      },
    );
  }

  void _showRoundDialog(
    BuildContext context,
    WidgetRef ref, [
    Round? round,
  ]) async {
    final l10n = AppLocalizations.of(context)!;
    DateTime selectedStartDate = round?.startDate ?? DateTime.now();
    DateTime selectedEndDate =
        round?.endDate ?? DateTime.now().add(const Duration(days: 3));
    RoundStatus selectedStatus = round?.status ?? RoundStatus.draft;
    String? selectedNeighborhoodId = round?.neighborhoodId;

    final transportCostController = TextEditingController(
      text: (round?.totalTransportCost ?? 100).toString(),
    );

    final allProducts = await ref.read(productsProvider.future);
    final neighborhoods = await ref
        .read(adminRepositoryProvider)
        .getNeighborhoods();

    final Map<String, RoundProduct> editingProducts = {};
    if (round != null) {
      for (var rp in round.roundProducts) {
        editingProducts[rp.productId] = rp;
      }
    } else {
      for (var p in allProducts) {
        editingProducts[p.id] = RoundProduct(
          id: '',
          productId: p.id,
          product: p,
          targetQuantityKg: p.minInventoryAmount,
          accumulatedQuantityKg: 0,
          estimatedWholesalePrice: p.estimatedWholesalePrice ?? 0,
          marginPerKg: 5,
          operationalSharePerKg: 2,
        );
      }
    }

    if (!context.mounted) return;

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            round == null
                ? l10n.createRound
                : '${l10n.editRound} (${round.id.substring(0, 8).toUpperCase()})',
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(l10n.startDate),
                    subtitle: Text(
                      '${selectedStartDate.year}-${selectedStartDate.month.toString().padLeft(2, '0')}-${selectedStartDate.day.toString().padLeft(2, '0')} ${selectedStartDate.hour.toString().padLeft(2, '0')}:${selectedStartDate.minute.toString().padLeft(2, '0')}',
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedStartDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                            selectedStartDate,
                          ),
                        );
                        if (time != null) {
                          setState(() {
                            selectedStartDate = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              time.hour,
                              time.minute,
                            );
                          });
                        }
                      }
                    },
                  ),
                  ListTile(
                    title: Text(l10n.endDate),
                    subtitle: Text(
                      '${selectedEndDate.year}-${selectedEndDate.month.toString().padLeft(2, '0')}-${selectedEndDate.day.toString().padLeft(2, '0')} ${selectedEndDate.hour.toString().padLeft(2, '0')}:${selectedEndDate.minute.toString().padLeft(2, '0')}',
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedEndDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(selectedEndDate),
                        );
                        if (time != null) {
                          setState(() {
                            selectedEndDate = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              time.hour,
                              time.minute,
                            );
                          });
                        }
                      }
                    },
                  ),
                  DropdownButtonFormField<String>(
                    initialValue: selectedNeighborhoodId,
                    decoration: InputDecoration(labelText: l10n.neighborhood),
                    items: neighborhoods.map((n) {
                      return DropdownMenuItem(value: n.id, child: Text(n.name));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedNeighborhoodId = value;
                      });
                    },
                  ),
                  DropdownButtonFormField<RoundStatus>(
                    initialValue: selectedStatus,
                    decoration: InputDecoration(labelText: l10n.status),
                    items: RoundStatus.values.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status.getLabel(l10n)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedStatus = value;
                        });
                      }
                    },
                  ),
                  TextField(
                    controller: transportCostController,
                    decoration: InputDecoration(
                      labelText: l10n.totalTransportCost,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppDimensions.spaceM),
                  Text(
                    l10n.products,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Divider(),
                  ...allProducts.map((product) {
                    final rp =
                        editingProducts[product.id] ??
                        RoundProduct(
                          id: '',
                          productId: product.id,
                          product: product,
                          targetQuantityKg: product.minInventoryAmount,
                          accumulatedQuantityKg: 0,
                          estimatedWholesalePrice:
                              product.estimatedWholesalePrice ?? 0,
                          marginPerKg: 5,
                          operationalSharePerKg: 2,
                        );

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: AppDimensions.paddingXS,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimensions.paddingS),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: editingProducts.containsKey(
                                    product.id,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      if (val == true) {
                                        editingProducts[product.id] = rp;
                                      } else {
                                        editingProducts.remove(product.id);
                                      }
                                    });
                                  },
                                ),
                                Expanded(child: Text(product.name)),
                              ],
                            ),
                            if (editingProducts.containsKey(product.id))
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimensions.paddingM,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: rp.targetQuantityKg
                                                .toString(),
                                            decoration: InputDecoration(
                                              labelText: l10n.targetKg,
                                            ),
                                            keyboardType: TextInputType.number,
                                            onChanged: (val) =>
                                                rp.targetQuantityKg =
                                                    double.tryParse(val) ?? 0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: AppDimensions.spaceS,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: rp
                                                .estimatedWholesalePrice
                                                .toString(),
                                            decoration: InputDecoration(
                                              labelText: l10n.wholesaleEgp,
                                            ),
                                            keyboardType: TextInputType.number,
                                            onChanged: (val) =>
                                                rp.estimatedWholesalePrice =
                                                    double.tryParse(val) ?? 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: rp.marginPerKg
                                                .toString(),
                                            decoration: InputDecoration(
                                              labelText: l10n.margin,
                                            ),
                                            keyboardType: TextInputType.number,
                                            onChanged: (val) => rp.marginPerKg =
                                                double.tryParse(val) ?? 0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: AppDimensions.spaceS,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            initialValue: rp
                                                .operationalSharePerKg
                                                .toString(),
                                            decoration: InputDecoration(
                                              labelText: l10n.opShare,
                                            ),
                                            keyboardType: TextInputType.number,
                                            onChanged: (val) =>
                                                rp.operationalSharePerKg =
                                                    double.tryParse(val) ?? 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (selectedNeighborhoodId == null ||
                      selectedNeighborhoodId!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a neighborhood'),
                      ),
                    );
                    return;
                  }

                  final filteredProducts = editingProducts.values
                      .where((rp) => rp.targetQuantityKg > 0)
                      .toList();

                  if (filteredProducts.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please add at least one product with target quantity',
                        ),
                      ),
                    );
                    return;
                  }

                  final newRound = Round(
                    id: round?.id ?? '',
                    roundNumber: round?.roundNumber ?? 0,
                    neighborhoodId: selectedNeighborhoodId!,
                    status: selectedStatus,
                    startDate: selectedStartDate,
                    endDate: selectedEndDate,
                    totalTransportCost:
                        double.tryParse(transportCostController.text) ?? 0,
                    roundProducts: filteredProducts,
                  );

                  await ref.read(adminRepositoryProvider).saveRound(newRound);
                  ref.invalidate(roundsProvider);
                  if (context.mounted) Navigator.pop(context);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                }
              },
              child: Text(l10n.save),
            ),
          ],
        ),
      ),
    );
  }
}
