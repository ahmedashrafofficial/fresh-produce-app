import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/order.dart';
import '../../l10n/app_localizations.dart';
import '../providers/admin_providers.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final ordersAsync = ref.watch(ordersProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ordersManagement)),
      body: ordersAsync.when(
        data: (orders) => _buildOrdersList(context, ref, orders),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
      ),
    );
  }

  Widget _buildOrdersList(
    BuildContext context,
    WidgetRef ref,
    List<Order> orders,
  ) {
    final l10n = AppLocalizations.of(context)!;
    if (orders.isEmpty) return Center(child: Text(l10n.noOrdersYet));

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ExpansionTile(
            title: Text(
              order.orderNumber > 0
                  ? '${l10n.order} #${order.orderNumber}'
                  : '${l10n.order} #${order.id.substring(0, 8)}',
            ),
            subtitle: Text(
              '${l10n.status}: ${_getStatusLabel(l10n, order.status)}',
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User: ${order.userName ?? 'Unknown'} (${order.userId})',
                    ),
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
                      (item) => Text(
                        '${item.productName ?? item.productId}: ${item.quantityKg} ${l10n.kg}',
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
                                  child: Text(_getStatusLabel(l10n, s)),
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
      },
    );
  }

  String _getStatusLabel(AppLocalizations l10n, OrderStatus status) {
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
}
