import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/all_items.dart';
import 'package:meatingless/services/functions/whole_price.dart';

FoodItem dbInterpreter(FoodItemDb item, WidgetRef ref) {
  FoodItem newItem = ref
      .read(allItemsProvider)
      .firstWhere((element) => element.name == item.name);
  return newItem;
}

FoodItemDb foodItemToDb(FoodItem item, DateTime date, int amount) {
  return FoodItemDb(
      name: item.name,
      price: wholeItemPrice(item),
      extras: item.ingredients.isEmpty ? false : true,
      addTime: date,
      amount: amount);
}
