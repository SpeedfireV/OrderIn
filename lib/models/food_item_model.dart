import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String name,
    required String description,
    required int price,
    required List<String> images,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, Object?> json) =>
      _$FoodItemFromJson(json);
}
