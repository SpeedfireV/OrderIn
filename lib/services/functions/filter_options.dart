import 'package:meatingless/models/food_item_model.dart';

List<FoodItem> filterItems(
  List<FoodItem> items, {
  int? rating,
}) {
  return items.where((element) => false).toList();
}
