import 'package:meatingless/models/ingredient_model.dart';
import 'package:meatingless/variables/ingredients_variables.dart';

Ingredient defineIngredient(Ingredients ingredientEnum) {
  return Ingredient(ingredientEnum: ingredientEnum, active: false);
}
