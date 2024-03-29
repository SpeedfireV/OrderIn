import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meatingless/models/firestore_models.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/variables/sorting_options.dart';

import 'ingredient_model.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String name,
    required String description,
    required FilterOptions category,
    required int price,
    required String mainImage,
    required int rating,
    required int numberOfRating,
    required bool favourite,
    required List<Ingredient> ingredients,
    int? amount,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, Object?> json) =>
      _$FoodItemFromJson(json);
}

OrderFirestore toOrderFirestore(FoodItem item) {
  List<Ingredients> ingredients = [];
  for (Ingredient ingredient in item.ingredients) {
    ingredients.add(ingredient.ingredientEnum);
  }
  return OrderFirestore(
    name: item.name,
    description: item.description,
    category: item.category,
    price: item.price,
    mainImage: item.mainImage,
    rating: item.rating,
    numberOfRating: item.numberOfRating,
    favourite: item.favourite,
    ingredients: ingredients,
  );
}
