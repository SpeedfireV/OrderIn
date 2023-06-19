import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';

import '../variables/images.dart';
import '../variables/ingredients_variables.dart';
import '../variables/sorting_options.dart';
import 'functions/define_ingredient.dart';

List<FoodItem> allItems = [
  FoodItem(
      name: "Vege Beef Burger",
      description: "Very tasty burger.",
      category: FilterOptions.burgers,
      price: 899,
      mainImage: LocalImages.vegeBeefBurger,
      rating: 49,
      numberOfRating: 3800,
      favourite: false,
      ingredients: []),
  FoodItem(
      name: "NY Style Earthy Pizza",
      description: "The impressive one.",
      category: FilterOptions.pizza,
      price: 1699,
      mainImage: LocalImages.nyEarthyPizza,
      rating: 44,
      numberOfRating: 3500,
      favourite: false,
      ingredients: []),
  FoodItem(
      name: "Chinese Extra Large Noodles",
      description:
          "Chinese Noodles are of the best original texture and taste. Experience is so good that you will come back to order more!",
      category: FilterOptions.noodles,
      price: 2499,
      mainImage: LocalImages.chineseNoodles,
      rating: 48,
      numberOfRating: 1705,
      favourite: false,
      ingredients: [
        defineIngredient(
          Ingredients.kimchi,
        ),
        defineIngredient(Ingredients.chiliFlakes),
        defineIngredient(Ingredients.extraSoySauce)
      ]),
  FoodItem(
      name: "Breakfast Set",
      description: "The impressive one.",
      category: FilterOptions.special,
      price: 3999,
      mainImage: LocalImages.seaSet,
      rating: 47,
      numberOfRating: 570,
      favourite: false,
      ingredients: [defineIngredient(Ingredients.mushroom)])
];

class AllItems extends StateNotifier<List<FoodItem>> {
  AllItems() : super(allItems);

  void changeFavorite(FoodItem item) {
    int index = 0;
    for (FoodItem currentItem in state) {
      if (currentItem == item) {
        break;
      }
      index += 1;
    }
    List<FoodItem> newState = state;
    newState = newState.sublist(0, index) +
        [newState[index].copyWith(favourite: !newState[index].favourite)] +
        newState.sublist(index + 1);
    state = newState;
  }
}

final AllItemsProvider =
    StateNotifierProvider<AllItems, List<FoodItem>>((ref) => AllItems());
