import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/variables/sorting_options.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem(
      {required String name,
      required String description,
      required SortingOptions category,
      required int price,
      required String mainImage,
      required int rating,
      required int numberOfRating,
      required bool favourite,
      required List<Ingredients> ingredients}) = _FoodItem;

  factory FoodItem.fromJson(Map<String, Object?> json) =>
      _$FoodItemFromJson(json);
}
