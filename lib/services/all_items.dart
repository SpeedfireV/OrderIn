import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';

class AllItems extends StateNotifier<List<FoodItem>> {
  AllItems() : super([]);

  void changeFavorite(FoodItem item) {
    int index = 0;
    for (FoodItem currentItem in state) {
      if (currentItem == item) {
        break;
      }
      index += 1;
    }
    List<FoodItem> newState = state;
    newState = newState.sublist(0, index) +
        [newState[index].copyWith(favourite: !newState[index].favourite)] +
        newState.sublist(index + 1);
    state = newState;
  }
}

final AllItemsProvider =
    StateNotifierProvider<AllItems, List<FoodItem>>((ref) => AllItems());
