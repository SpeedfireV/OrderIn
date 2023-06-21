import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/database.dart';
import '../models/database_model.dart';

class OrderHistoryNotifier extends StateNotifier<Iterable<List<FoodItemDb>>> {
  OrderHistoryNotifier() : super(DatabaseServices().getOrders());

  void addToHistory(List<FoodItemDb> order) {
    state = [...state, order];
  }
}

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, Iterable<List<FoodItemDb>>>(
        (ref) => OrderHistoryNotifier());
