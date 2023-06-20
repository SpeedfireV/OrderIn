import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../variables/colors.dart';
import 'bottom_bar_item.dart';

class AppBottomBar extends ConsumerStatefulWidget {
  const AppBottomBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends ConsumerState<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(90),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(90),
        ),
        height: 70,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppBottomBarItem(
              icon: Icons.history,
              position: 0,
            ),
            AppBottomBarItem(
              icon: Icons.home,
              position: 1,
            ),
            AppBottomBarItem(
              icon: Icons.person,
              position: 2,
            )
          ]),
        ),
      ),
    );
  }
}
