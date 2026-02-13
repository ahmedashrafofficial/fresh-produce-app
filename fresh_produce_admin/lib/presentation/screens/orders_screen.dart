import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_dimensions.dart';
import '../../core/utils/extensions/order_status_extensions.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
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
          margin: const EdgeInsets.all(AppDimensions.paddingS),
          child: ExpansionTile(
            title: Text(
              order.orderNumber > 0
                  ? '${l10n.order} #${order.orderNumber}'
                  : '${l10n.order} #${order.id.substring(0, 8)}',
            ),
            subtitle: Text('${l10n.status}: ${order.status.getLabel(l10n)}'),
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingM),
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
                    const SizedBox(height: AppDimensions.spaceM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton<OrderStatus>(
                          value: order.status,
                          items: OrderStatus.values
                              .map(
                                (s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(s.getLabel(l10n)),
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
}
