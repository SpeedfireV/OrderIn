import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/sorting_options.dart';
import 'package:meatingless/variables/padding.dart';

import '../../variables/sorting_options.dart';
import 'filter_icon.dart';

class FilterOptionsWidget extends ConsumerStatefulWidget {
  const FilterOptionsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SortingOptionsWidgetState();
}

class _SortingOptionsWidgetState extends ConsumerState<FilterOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    FilterOptions sortingOptions = ref.watch(sortingOptionsProvider);
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(width: horizontalPadding),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => FilterIcon(
                  turned: sortingOptions == listSortingOptions()[index],
                  option: listSortingOptions()[index],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 24,
                ),
            itemCount: listSortingOptions().length - 1),
        const SizedBox(width: horizontalPadding),
      ],
    );
  }
}
