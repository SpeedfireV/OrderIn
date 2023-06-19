import 'package:meatingless/variables/ingredients_variables.dart';

import '../../models/food_item_model.dart';
import '../../models/ingredient_model.dart';

int wholeOrderPrice(Map<FoodItem, int> order) {
  List<FoodItem> itemList = order.keys.toList();
  List<int> amountList = order.values.toList();
  int sum = 0;
  for (int i = 0; i < order.keys.length; i++) {
    int itemCost = 0;
    List<Ingredient> ingredients = itemList[i].ingredients;
    itemCost += itemList[i].price;
    for (Ingredient ingredient in ingredients) {
      itemCost += IngredientsVariables
          .mapOfIngredientsPrice[ingredient.ingredientEnum]!;
    }
    sum += itemCost * amountList[i];
  }
  return sum;
}

int wholeItemPrice(FoodItem item) {
  int sum = 0;
  for (Ingredient ingredient in item.ingredients) {
    sum +=
        IngredientsVariables.mapOfIngredientsPrice[ingredient.ingredientEnum]!;
  }
  sum += item.price;
  return sum;
}
