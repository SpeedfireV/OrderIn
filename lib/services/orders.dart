import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';

class OrdersNotifier extends StateNotifier<Map<FoodItem, int>> {
  OrdersNotifier() : super({});

  void addItem(FoodItem item) {
    if (state.containsKey(item)) {
      state[item] = state[item]! + 1;
    } else {
      state[item] = 1;
    }
  }

  void deleteItem(FoodItem item) {
    state.remove(item);
  }

  void resetOrder() {
    state = {};
  }
}

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, Map<FoodItem, int>>((ref) {
  return OrdersNotifier();
});
