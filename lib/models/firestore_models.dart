import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meatingless/variables/ingredients_variables.dart';
import 'package:meatingless/variables/sorting_options.dart';
import 'package:flutter/foundation.dart';

part 'firestore_models.freezed.dart';
part 'firestore_models.g.dart';

@freezed
class OrderFirestore with _$OrderFirestore {
  const factory OrderFirestore(
      {required String name,
      required String description,
      required FilterOptions category,
      required int price,
      required String mainImage,
      required int rating,
      required int numberOfRating,
      required bool favourite,
      required List<Ingredients> ingredients,
      int? amount}) = _OrderFirestore;
  factory OrderFirestore.fromJson(Map<String, Object?> json) =>
      _$OrderFirestoreFromJson(json);
}
