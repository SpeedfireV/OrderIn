import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/models/ingredient_model.dart';

import '../orders.dart';

void addToCart(FoodItem item, WidgetRef ref, List<Ingredient> ingredients) {
  ref.read(ordersProvider.notifier).addItem(item.copyWith(
      ingredients: ingredients
          .toList()
          .where((element) => element.active == true)
          .toList()));
  ref.read(newItemsProvider.notifier).state += 1;
}
