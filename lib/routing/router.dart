import 'package:go_router/go_router.dart';
import 'package:meatingless/screens/main_page.dart';

import '../screens/order_history.dart';
import '../screens/order_page.dart';
import '../screens/profile_page.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => MainPage()),
  GoRoute(path: "/history", builder: (context, state) => HistoryPage()),
  GoRoute(
    path: "/order",
    builder: (context, state) => OrderPage(),
  ),
  GoRoute(
    path: "/profile",
    builder: (context, state) => ProfilePage(),
  )
]);
