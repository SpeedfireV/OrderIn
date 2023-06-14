import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/widgets/bottom_bar_item.dart';

import '../services/bottom_app_bar.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(bottomAppBarPositionProvider);
    return Scaffold(
        body: Stack(children: [
      ListView(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(90),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(90),
              ),
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBottomBarItem(icon: Icons.history, label: "history"),
                      AppBottomBarItem(
                        icon: Icons.home,
                        label: "home",
                      ),
                      AppBottomBarItem(icon: Icons.person, label: "profile")
                    ]),
              ),
            ),
          ),
        ),
      )
    ]));
  }
}
