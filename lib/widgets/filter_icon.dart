import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/icons.dart';

class FilterIcon extends ConsumerStatefulWidget {
  const FilterIcon({super.key, required this.turned});
  final bool turned;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterIconState();
}

class _FilterIconState extends ConsumerState<FilterIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        elevation: 6,
        shadowColor:
            widget.turned ? AppColors.mainColor : AppColors.turnedOffColor,
        shape: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: widget.turned
                  ? AppColors.mainColor
                  : AppColors.turnedOffColor,
              shape: BoxShape.circle),
          child: Image(
            image: AssetImage(SortingIcons.burger),
            width: 32,
            height: 32,
          ),
        ),
      ),
      SizedBox(height: 8),
      Text(
        "Burgers",
        style: TextStyle(
            color: widget.turned ? AppColors.mainColor : AppColors.lightColor,
            fontWeight: widget.turned ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15),
      )
    ]);
  }
}
