import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedNeighborhoodNotifier extends Notifier<String?> {
  @override
  String? build() => null;
  void select(String? id) => state = id;
}
