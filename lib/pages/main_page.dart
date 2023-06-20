import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/pages/home_page.dart';
import 'package:meatingless/pages/order_history_page.dart';
import 'package:meatingless/services/bottom_app_bar.dart';
import 'package:meatingless/variables/padding.dart';
import '../widgets/main_page/bottom_bar.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController controller = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bottomAppBarPositionProvider);
    ref.listen(bottomAppBarPositionProvider, (previous, next) {
      controller.animateToPage(next,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
    });
    return Scaffold(
        body: Stack(children: [
      PageView(
        onPageChanged: (value) {
          ref.read(bottomAppBarPositionProvider.notifier).changePosition(value);
        },
        controller: controller,
        children: [
          HistoryPage(),
          HomePage(),
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 16),
            child: AppBottomBar()),
      )
    ]));
  }
}
