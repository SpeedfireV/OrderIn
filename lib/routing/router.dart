import 'package:go_router/go_router.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/pages/item_page.dart';
import 'package:meatingless/pages/main_page.dart';

import '../pages/order_history_page.dart';
import '../pages/order_page.dart';
import '../pages/profile_page.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: "/", name: "home", builder: (context, state) => const MainPage()),
  GoRoute(
      path: "/history",
      name: "history",
      builder: (context, state) => const HistoryPage()),
  GoRoute(
    path: "/order",
    name: "order",
    builder: (context, state) => const OrderPage(),
  ),
  GoRoute(
    path: "/profile",
    name: "profile",
    builder: (context, state) {
      List profile = state.extra as List;

      return ProfilePage(
        currentProfile: profile.elementAt(0),
        needed: profile.length > 1 ? profile.elementAt(1) : null,
      );
    },
  ),
  GoRoute(
      path: "/item",
      name: "item",
      builder: (context, state) {
        FoodItem item = state.extra as FoodItem;
        return ItemPage(
          item: item,
        );
      })
]);
