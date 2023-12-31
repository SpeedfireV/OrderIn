import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';

class OrdersNotifier extends StateNotifier<Map<FoodItem, int>> {
  OrdersNotifier() : super({});

  void addItem(FoodItem item) {
    Map<FoodItem, int> localItems = state;
    if (state.containsKey(item)) {
      state[item] = state[item]! + 1;
    } else {
      localItems[item] = 1;
    }
    state = {...localItems};
  }

  void decreaseItem(FoodItem item) {
    Map<FoodItem, int> localItems = state;
    localItems[item] = localItems[item]! - 1;
    state = {...localItems};
  }

  void deleteItem(FoodItem item) {
    Map<FoodItem, int> newOrders = state;
    newOrders.remove(item);
    state = {...newOrders};
  }

  void resetOrder() {
    state = {};
  }

  Map<FoodItem, int> getOrder() {
    return state;
  }
}

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, Map<FoodItem, int>>((ref) {
  return OrdersNotifier();
});

final newItemsProvider = StateProvider((ref) => 0);
