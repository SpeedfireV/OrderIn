import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'ingredient_model.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem(
      {required String name,
      required String description,
      required int price,
      required String mainImage,
      required int rating,
      required int numberOfRating,
      required bool favourite,
      required List<Ingredient> ingredients}) = _FoodItem;

  factory FoodItem.fromJson(Map<String, Object?> json) =>
      _$FoodItemFromJson(json);
}
