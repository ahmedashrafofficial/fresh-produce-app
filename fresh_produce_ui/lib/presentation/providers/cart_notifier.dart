import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<Map<String, double>> {
  @override
  Map<String, double> build() => {};

  void clear() => state = {};

  void update(String productId, double quantity) {
    if (quantity <= 0) {
      state = {...state}..remove(productId);
    } else {
      state = {...state, productId: quantity};
    }
  }
}
