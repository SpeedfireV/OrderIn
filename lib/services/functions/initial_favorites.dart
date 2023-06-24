import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/database.dart';

List<FoodItem> initialFavorites(List<FoodItem> items) {
  Iterable<String> favorites = DatabaseServices().favoriteBox.values;
  for (String favorite in favorites) {
    for (int i = 0; i < items.length; i++) {
      if (items.elementAt(i).name == favorite) {
        items[i] = items.elementAt(i).copyWith(favourite: true);
        break;
      }
    }
  }
  return items;
}
