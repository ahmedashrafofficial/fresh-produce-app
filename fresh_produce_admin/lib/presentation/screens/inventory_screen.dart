import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/product.dart';
import '../../l10n/app_localizations.dart';
import '../providers/admin_providers.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final productsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.inventory)),
      body: productsAsync.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final p = products[index];
            return ListTile(
              title: Text(p.name),
              subtitle: Text(
                '${l10n.min} ${p.minInventoryAmount} ${p.unit} - ${l10n.wholesaleEgp} ${p.estimatedWholesalePrice ?? 0}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _showProductDialog(context, ref, p),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text(l10n.error(e.toString()))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showProductDialog(
    BuildContext context,
    WidgetRef ref, [
    Product? product,
  ]) {
    final l10n = AppLocalizations.of(context)!;
    final nameController = TextEditingController(text: product?.name ?? '');
    final unitController = TextEditingController(text: product?.unit ?? 'kg');
    final minAmountController = TextEditingController(
      text: (product?.minInventoryAmount ?? 0).toString(),
    );
    final priceController = TextEditingController(
      text: (product?.estimatedWholesalePrice ?? 0).toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product == null ? l10n.addProduct : l10n.editProduct),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: l10n.name),
            ),
            TextField(
              controller: unitController,
              decoration: InputDecoration(labelText: l10n.unit),
            ),
            TextField(
              controller: minAmountController,
              decoration: InputDecoration(labelText: l10n.minInventoryAmount),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: l10n.wholesaleEgp),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              final newProduct = Product(
                id: product?.id ?? '0',
                name: nameController.text,
                unit: unitController.text,
                minInventoryAmount:
                    double.tryParse(minAmountController.text) ?? 0,
                imageUrl: product?.imageUrl,
                estimatedWholesalePrice:
                    double.tryParse(priceController.text) ?? 0,
              );

              await ref.read(adminRepositoryProvider).saveProduct(newProduct);
              ref.invalidate(productsProvider);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }
}
