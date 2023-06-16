import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/ingredient_model.dart';

List<Ingredient> currentIngredients = [];

final ingredientsPriceProvider = StateProvider.autoDispose((ref) => 0);

class IngredientsListNotifier extends StateNotifier<List<Ingredient>> {
  IngredientsListNotifier() : super(currentIngredients);

  void changeActive(int index) {
    state = state.sublist(0, index) +
        [
          Ingredient(
              ingredientEnum: state[index].ingredientEnum,
              active: !state[index].active)
        ] +
        state.sublist(index + 1);
  }
}

final ingredientsListProvider = StateNotifierProvider.autoDispose<
    IngredientsListNotifier, List<Ingredient>>((ref) {
  return IngredientsListNotifier();
});
