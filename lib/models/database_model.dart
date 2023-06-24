import 'package:hive/hive.dart';

part 'database_model.g.dart';

@HiveType(typeId: 1)
class FoodItemDb {
  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  bool extras;
  @HiveField(3)
  DateTime addTime;
  @HiveField(4)
  int amount;

  FoodItemDb(
      {required this.name,
      required this.price,
      required this.extras,
      required this.addTime,
      required this.amount});
}

@HiveType(typeId: 2)
class ProfileDb {
  @HiveField(0)
  String name;
  @HiveField(1)
  String street;
  @HiveField(2)
  String phone;

  ProfileDb({required this.name, required this.street, required this.phone});
}
