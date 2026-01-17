import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_produce_ui/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../providers/ui_providers.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  final String roundId;

  const CheckoutScreen({super.key, required this.roundId});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  bool _isProcessing = false;
  bool _wantsDelivery = true;
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final activeRoundsAsync = ref.watch(activeRoundsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: activeRoundsAsync.when(
          data: (rounds) {
            final round = rounds.firstWhere((r) => r.id == widget.roundId);
            final titleStr = round.roundNumber > 0
                ? '${l10n.roundHash}${round.roundNumber}'
                : '${l10n.roundHash}${widget.roundId.substring(0, 8).toUpperCase()}';
            return Text('${l10n.checkout} - $titleStr');
          },
          loading: () => Text(l10n.checkout),
          error: (e, s) => Text(l10n.checkout),
        ),
      ),
      body: activeRoundsAsync.when(
        data: (rounds) {
          final round = rounds.firstWhere((r) => r.id == widget.roundId);
          double totalEstimated = 0;

          final orderItems = <Map<String, dynamic>>[];
          for (var entry in cart.entries) {
            final rp = round.products.firstWhere(
              (p) => p.productId == entry.key,
            );
            totalEstimated +=
                (rp.actualCustomerPrice ?? rp.estimatedCustomerPrice) *
                entry.value;
            orderItems.add({'productId': entry.key, 'quantityKg': entry.value});
          }

          final deliveryFee = round.neighborhood?.deliveryFee ?? 10.0;
          final pickupAddress = round.neighborhood?.pickupPointAddress;
          final totalWithDelivery = _wantsDelivery
              ? totalEstimated + deliveryFee
              : totalEstimated;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Text(
                      l10n.orderSummary,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ...cart.entries.map((entry) {
                      final rp = round.products.firstWhere(
                        (p) => p.productId == entry.key,
                      );
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${rp.product?.name} x ${entry.value.toInt()}${l10n.kg}',
                            ),
                            Text(
                              '${((rp.actualCustomerPrice ?? rp.estimatedCustomerPrice) * entry.value).toStringAsFixed(2)} ${l10n.egp}',
                            ),
                          ],
                        ),
                      );
                    }),
                    const Divider(height: 32),

                    // Delivery Option Toggle
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _wantsDelivery
                              ? const Color(0xFF2D6A4F)
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CheckboxListTile(
                        title: Text(
                          '🚚 ${l10n.delivery} (+${deliveryFee.toStringAsFixed(0)} ${l10n.egp})',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: _wantsDelivery
                            ? const Text('Deliver to your address')
                            : null,
                        value: _wantsDelivery,
                        activeColor: const Color(0xFF2D6A4F),
                        onChanged: (v) => setState(() => _wantsDelivery = v!),
                      ),
                    ),

                    // Delivery address and phone inputs
                    if (_wantsDelivery) ...[
                      const SizedBox(height: 16),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Delivery Address',
                          hintText: 'Enter your full address',
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: '01xxxxxxxxx',
                          prefixIcon: const Icon(Icons.phone_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ],

                    if (!_wantsDelivery && pickupAddress != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: Row(
                          children: [
                            const Text('📍', style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.pickup,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    pickupAddress,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // COD Notice with Total
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D6A4F).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Text('💵', style: TextStyle(fontSize: 24)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.cashOnDeliveryNotice,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D6A4F),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${l10n.total}: ${totalWithDelivery.toStringAsFixed(2)} ${l10n.egp}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: _isProcessing
                        ? null
                        : () async {
                            // Validate address if delivery is selected
                            if (_wantsDelivery &&
                                _addressController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter your delivery address',
                                  ),
                                ),
                              );
                              return;
                            }
                            if (_wantsDelivery &&
                                _phoneController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter your phone number',
                                  ),
                                ),
                              );
                              return;
                            }

                            setState(() => _isProcessing = true);
                            try {
                              await ref
                                  .read(repositoryProvider)
                                  .placeOrder(
                                    roundId: widget.roundId,
                                    items: orderItems,
                                    deliveryType: _wantsDelivery ? 0 : 1,
                                    deliveryAddress: _wantsDelivery
                                        ? _addressController.text.trim()
                                        : null,
                                    deliveryPhone: _wantsDelivery
                                        ? _phoneController.text.trim()
                                        : null,
                                  );
                              ref.invalidate(activeRoundsProvider);
                              ref.read(cartProvider.notifier).clear();
                              if (mounted) context.go('/order-success');
                            } catch (e) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(l10n.error(e.toString())),
                                  ),
                                );
                              }
                            } finally {
                              if (mounted) {
                                setState(() => _isProcessing = false);
                              }
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    child: _isProcessing
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(l10n.placeOrder),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
