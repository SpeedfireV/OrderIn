import 'package:go_router/go_router.dart';
import 'package:meatingless/screens/main_page.dart';

import '../screens/order_history.dart';
import '../screens/order_page.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => MainPage()),
  GoRoute(path: "/tips", builder: (context, state) => HistoryPage()),
  GoRoute(
    path: "/order",
    builder: (context, state) => OrderPage(),
  )
]);
