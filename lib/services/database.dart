import 'package:hive_flutter/adapters.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/functions/whole_price.dart';

class DatabaseServices {
  final box = Hive.box<FoodItemDb>("history");

  void addOrder(FoodItem item) {
    box.add(FoodItemDb(
        name: item.name,
        price: wholeItemPrice(item),
        extras: item.ingredients.isNotEmpty,
        addTime: DateTime.now()));
  }

  List<FoodItemDb> getOrders() {
    return box.values as List<FoodItemDb>;
  }
}
