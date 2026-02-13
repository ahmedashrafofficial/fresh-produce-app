import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/order_status.dart';
import '../providers/ui_providers.dart';
import '../widgets/status_chip.dart';

class MyOrdersScreen extends ConsumerStatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  ConsumerState<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends ConsumerState<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final myOrdersAsync = ref.watch(myOrdersProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myOrders)),
      body: auth == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.pleaseLoginToViewOrders),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.push('/login'),
                    child: Text(l10n.login),
                  ),
                ],
              ),
            )
          : myOrdersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return Center(child: Text(l10n.noOrdersYet));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final dateStr = DateFormat(
                      'MMM dd, yyyy',
                    ).format(order.orderDate);

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order.orderNumber != null &&
                                          order.orderNumber! > 0
                                      ? '${l10n.orderNo}${order.orderNumber}'
                                      : '${l10n.orderNo}${order.id.substring(0, 8).toUpperCase()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                StatusChip(status: order.status),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${l10n.placedOn}$dateStr',
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Order Items
                            if (order.items.isNotEmpty) ...[
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.05,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.orderItems,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ...order.items.map(
                                      (item) => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${item.product?.name ?? 'Product'} x ${item.quantityKg.toStringAsFixed(1)} ${l10n.kg}',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${((item.finalPricePerKg ?? item.estimatedPricePerKg) * item.quantityKg).toStringAsFixed(2)} ${l10n.egp}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${l10n.total}:'),
                                if (order.finalAmount != null &&
                                    (order.finalAmount! -
                                                order.totalEstimatedAmount)
                                            .abs() >
                                        0.01) ...[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${order.totalEstimatedAmount.toStringAsFixed(2)} ${l10n.egp} (${l10n.totalEstimated})',
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12,
                                          color: AppColors.grey,
                                        ),
                                      ),
                                      Text(
                                        '${order.finalAmount!.toStringAsFixed(2)} ${l10n.egp}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  Text(
                                    '${(order.finalAmount ?? order.totalEstimatedAmount).toStringAsFixed(2)} ${l10n.egp}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ],
                            ),

                            if (order.status ==
                                OrderStatus.awaitingConfirmation) ...[
                              const Divider(height: 32),
                              Text(
                                l10n.priceChangedNotice,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.warning,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        await ref
                                            .read(repositoryProvider)
                                            .rejectOrder(order.id);
                                        ref.invalidate(myOrdersProvider);
                                      },
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: AppColors.error,
                                      ),
                                      child: Text(l10n.reject),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await ref
                                            .read(repositoryProvider)
                                            .confirmOrder(order.id);
                                        ref.invalidate(myOrdersProvider);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.white,
                                      ),
                                      child: Text(l10n.confirm),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            if (order.status == OrderStatus.confirmed ||
                                order.status == OrderStatus.paid) ...[
                              const Divider(height: 24),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      '💵',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            l10n.amountDueOnDelivery,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            '${(order.finalAmount ?? order.totalEstimatedAmount).toStringAsFixed(2)} ${l10n.egp}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) {
                // Check if this is a session expiration error
                final errorMessage = e.toString();
                if (errorMessage.contains('session has expired') ||
                    errorMessage.contains('401')) {
                  // Redirect to login after a brief delay
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (mounted) {
                      context.go('/login');
                    }
                  });
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lock_clock,
                            size: 64,
                            color: AppColors.warning,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Session Expired',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Redirecting to login...',
                            style: const TextStyle(color: AppColors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Center(child: Text(l10n.error(errorMessage)));
              },
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Refresh orders every time the screen is opened
    Future.microtask(() => ref.invalidate(myOrdersProvider));
  }
}
