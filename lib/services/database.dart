import 'package:hive_flutter/adapters.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/functions/db_intepreter.dart';

class DatabaseServices {
  final box = Hive.box<List>("history");

  void addOrder(List<FoodItem> items, List<int> amount) {
    DateTime date = DateTime.now();
    List databaseItems = [];
    for (int i = 0; i < items.length; i++) {
      databaseItems.add(foodItemToDb(items[i], date, amount[i]));
    }
    box.add(databaseItems);
  }

  getOrders() {
    return box.values;
  }
}
