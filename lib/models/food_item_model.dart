import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meatingless/variables/sorting_options.dart';

import 'ingredient_model.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem(
      {required String name,
      required String description,
      required FilterOptions category,
      required int price,
      required String mainImage,
      required int rating,
      required int numberOfRating,
      required bool favourite,
      required List<Ingredient> ingredients,
      int? amount}) = _FoodItem;

  factory FoodItem.fromJson(Map<String, Object?> json) =>
      _$FoodItemFromJson(json);
}
