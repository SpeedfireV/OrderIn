import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meatingless/models/firestore_models.dart';

class FirestoreServices {
  final db = FirebaseFirestore.instance;
  addOrder(OrderFirestore order) {
    db
        .collection('orders')
        .add(order.toJson())
        .then((DocumentReference doc) => log("haha"));
  }
}
