import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/all_items.dart';

FoodItem dbInterpreter(FoodItemDb item, WidgetRef ref) {
  FoodItem newItem = ref
      .read(allItemsProvider)
      .firstWhere((element) => element.name == item.name);
  return newItem;
}
