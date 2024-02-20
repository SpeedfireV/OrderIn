import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatingless/models/firestore_models.dart';
import 'package:meatingless/models/food_item_model.dart';

class FirestoreServices {
  final db = FirebaseFirestore.instance;
  addOrder(List<FoodItem> order) {
    List<OrderFirestore> items = [];

    db
        .collection('orders')
        .add(order.toJson())
        .then((DocumentReference doc) => log("haha"));
  }
}
