import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatingless/models/firestore_models.dart';
import 'package:meatingless/models/food_item_model.dart';

class FirestoreServices {
  final db = FirebaseFirestore.instance;
  addOrder(Map<FoodItem, int> order) {
    List<OrderFirestore> items = [];
    for (FoodItem item in order.keys) {
      OrderFirestore orderItem = toOrderFirestore(item);
      orderItem = orderItem.copyWith(amount: order[item]);
      items.add(orderItem);
    }

    for (OrderFirestore item in items) {
      db
          .collection('orders')
          .add(item.toJson())
          .then((DocumentReference doc) => log("Doc added with ${doc.id}"));
    }
  }
}
