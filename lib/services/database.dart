import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/services/functions/db_intepreter.dart';

class DatabaseServices {
  final historyBox = Hive.box<List>("history");
  final profileBox = Hive.box<ProfileDb>("profile");
  final favoriteBox = Hive.box<String>("favorite");

  void addOrder(List<FoodItem> items, List<int> amount) {
    DateTime date = DateTime.now();
    List databaseItems = [];
    for (int i = 0; i < items.length; i++) {
      databaseItems.add(foodItemToDb(items[i], date, amount[i]));
    }
    historyBox.add(databaseItems);
  }

  Iterable<List> getOrders() {
    return historyBox.values;
  }

  ProfileDb getProfile() {
    if (profileBox.values.isEmpty) {
      profileBox.add(ProfileDb(name: "", street: "", phone: ""));
      return ProfileDb(name: "", street: "", phone: "");
    } else {
      return profileBox.getAt(0)!;
    }
  }

  void changeProfile(ProfileDb newProfile) {
    profileBox.put(0, newProfile);
  }

  void addFavorite(String name) {
    favoriteBox.add(name);
  }

  void deleteFavorite(String name) {
    for (int i = 0; i < favoriteBox.values.length; i++) {
      if (favoriteBox.getAt(i) == name) {
        favoriteBox.deleteAt(i);
        break;
      }
    }
  }
}
