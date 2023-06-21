import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/functions/db_intepreter.dart';

class DatabaseServices {
  final box = Hive.box<List<FoodItemDb>>("history");

  void addOrder(List<FoodItem> items, List<int> amount, WidgetRef ref) {
    DateTime date = DateTime.now();
    List<FoodItemDb> databaseItems = [];
    for (int i = 0; i < items.length; i++) {
      databaseItems.add(foodItemToDb(items[i], date, amount[i]));
    }
    box.add(databaseItems);
  }

  Iterable<List<FoodItemDb>> getOrders() {
    return box.values;
  }
}
