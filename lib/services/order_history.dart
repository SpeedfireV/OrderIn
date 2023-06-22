import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/database.dart';

class OrderHistoryNotifier extends StateNotifier<Iterable<List>> {
  OrderHistoryNotifier() : super(DatabaseServices().getOrders());

  void addToHistory(List order) {
    state = [...state, order];
  }

  Iterable<List> getHistory() {
    return state;
  }
}

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, Iterable<List>>(
        (ref) => OrderHistoryNotifier());
