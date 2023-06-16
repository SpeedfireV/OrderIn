import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/services/sorting_options.dart';

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
    ref.watch(SortingOptionsProvider);
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(width: 24),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => FilterIcon(
                  turned: ref.read(SortingOptionsProvider.notifier).state ==
                      listSortingOptions()[index],
                  option: listSortingOptions()[index],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 24,
                ),
            itemCount: listSortingOptions().length),
        const SizedBox(width: 16),
      ],
    );
  }
}
