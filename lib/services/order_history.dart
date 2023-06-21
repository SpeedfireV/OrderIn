import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/database.dart';

import '../models/database_model.dart';

class OrderHistoryNotifier extends StateNotifier<List<FoodItemDb>> {
  OrderHistoryNotifier() : super(DatabaseServices().getOrders());
}

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, List<FoodItemDb>>(
        (ref) => OrderHistoryNotifier());
