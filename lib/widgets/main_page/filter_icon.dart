import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/sorting_options.dart';
import 'package:meatingless/variables/colors.dart';
import 'package:meatingless/variables/sorting_variables.dart';
import 'package:meatingless/variables/sorting_options.dart';

class FilterIcon extends ConsumerStatefulWidget {
  const FilterIcon({super.key, required this.turned, required this.option});
  final bool turned;
  final SortingOptions option;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterIconState();
}

class _FilterIconState extends ConsumerState<FilterIcon> {
  @override
  Widget build(BuildContext context) {
    ref.watch(sortingOptionsProvider);
    return GestureDetector(
      onTap: () {
        debugPrint("Changed sorting category");
        ref.read(sortingOptionsProvider.notifier).changeOption(widget.option);
      },
      child: Column(children: [
        Material(
          elevation: 6,
          shadowColor:
              widget.turned ? AppColors.mainColor : AppColors.lightColor,
          shape: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color:
                    widget.turned ? AppColors.mainColor : AppColors.lightColor,
                shape: BoxShape.circle),
            child: Image(
              image: AssetImage(
                  SortingVariables.mapOfSortingDirectories[widget.option]!),
              width: 36,
              height: 36,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          SortingVariables.mapOfTitles[widget.option]!,
          style: TextStyle(
            color: widget.turned
                ? AppColors.mainColor
                : AppColors.mainColorReversed,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        )
      ]),
    );
  }
}
