import '../../models/food_item_model.dart';

Iterable<FoodItem> searchFilter(String text, List<FoodItem> items) {
  return items.where(
      (element) => element.name.toLowerCase().contains(text.toLowerCase()));
}
