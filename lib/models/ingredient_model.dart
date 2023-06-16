import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meatingless/variables/ingredients_variables.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient(
      {required Ingredients ingredientEnum,
      required bool active}) = _Ingredient;
  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);
}
