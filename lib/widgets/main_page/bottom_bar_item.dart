import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/bottom_app_bar.dart';
import 'package:meatingless/variables/colors.dart';

class AppBottomBarItem extends ConsumerWidget {
  const AppBottomBarItem(
      {super.key, required this.icon, required this.position});
  final IconData icon;
  final int position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentPosition = ref.watch(bottomAppBarPositionProvider);
    return Material(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(90))),
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          ref
              .read(bottomAppBarPositionProvider.notifier)
              .changePosition(position);
        },
        child: Ink(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: currentPosition == position
                  ? AppColors.secondaryColor
                  : Colors.transparent),
          child: Icon(icon,
              size: 28,
              color: currentPosition == position
                  ? AppColors.lightColor
                  : AppColors.secondaryColorLight),
        ),
      ),
    );
  }
}
