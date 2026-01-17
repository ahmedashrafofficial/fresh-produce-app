import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/neighborhood.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/round.dart';
import '../../l10n/app_localizations.dart';
import '../providers/admin_providers.dart';

class RoundDetailsScreen extends ConsumerWidget {
  final Round round;
  final Neighborhood neighborhood;

  const RoundDetailsScreen({
    super.key,
    required this.round,
    required this.neighborhood,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          round.roundNumber > 0
              ? '${l10n.roundPrefix}#${round.roundNumber}'
              : '${l10n.roundPrefix}${round.id.substring(0, 8).toUpperCase()}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRoundInfoCard(context, l10n),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.ordersManagement, // Or "Orders"
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            ordersAsync.when(
              data: (allOrders) {
                final roundOrders = allOrders
                    .where((o) => o.roundId == round.id)
                    .toList();

                if (roundOrders.isEmpty) {
                  return Center(child: Text(l10n.noOrdersYet));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: roundOrders.length,
                  itemBuilder: (context, index) {
                    return _buildOrderCard(
                      context,
                      ref,
                      roundOrders[index],
                      l10n,
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    WidgetRef ref,
    Order order,
    AppLocalizations l10n,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Text(
          order.orderNumber > 0
              ? '${l10n.order} #${order.orderNumber}'
              : '${l10n.order} #${order.id.substring(0, 8)}',
        ),
        subtitle: Text(
          '${l10n.status}: ${_getOrderStatusLabel(l10n, order.status)}',
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User: ${order.userName ?? 'Unknown'} (${order.userId})',
                ), // Adding User ID as requested for "full details"
                Text(
                  '${l10n.date}: ${DateFormat('yyyy-MM-dd HH:mm').format(order.orderDate)}',
                ),
                Text(
                  '${l10n.total}: ${order.totalEstimatedAmount.toStringAsFixed(2)} ${l10n.egp}',
                ),
                const Divider(),
                Text(
                  l10n.items,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ...order.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${item.productName ?? item.productId}: ${item.quantityKg} ${l10n.kg}',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButton<OrderStatus>(
                      value: order.status,
                      items: OrderStatus.values
                          .map(
                            (s) => DropdownMenuItem(
                              value: s,
                              child: Text(_getOrderStatusLabel(l10n, s)),
                            ),
                          )
                          .toList(),
                      onChanged: (newStatus) {
                        if (newStatus != null) {
                          ref
                              .read(adminRepositoryProvider)
                              .updateOrderStatus(order.id, newStatus.name);
                          ref.invalidate(ordersProvider);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundInfoCard(BuildContext context, AppLocalizations l10n) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              neighborhood.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('${l10n.status}: ${_getRoundStatusLabel(l10n, round.status)}'),
            Text(
              '${l10n.startDate}: ${DateFormat('yyyy-MM-dd HH:mm').format(round.startDate)}',
            ),
            Text(
              '${l10n.endDate}: ${DateFormat('yyyy-MM-dd HH:mm').format(round.endDate)}',
            ),
            Text(
              '${l10n.totalTransportCost}: ${round.totalTransportCost} ${l10n.egp}',
            ),
          ],
        ),
      ),
    );
  }

  String _getOrderStatusLabel(AppLocalizations l10n, OrderStatus status) {
    switch (status) {
      case OrderStatus.placed:
        return l10n.statusPlaced;
      case OrderStatus.awaitingConfirmation:
        return l10n.statusAwaitingConfirmation;
      case OrderStatus.confirmed:
        return l10n.statusConfirmed;
      case OrderStatus.rejected:
        return l10n.statusRejected;
      case OrderStatus.paid:
        return l10n.statusPaid;
      case OrderStatus.delivered:
        return l10n.statusDelivered;
      case OrderStatus.cancelled:
        return l10n.statusCancelled;
    }
  }

  String _getRoundStatusLabel(AppLocalizations l10n, RoundStatus status) {
    switch (status) {
      case RoundStatus.draft:
        return l10n.roundStatusDraft;
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
