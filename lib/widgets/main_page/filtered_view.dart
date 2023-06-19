import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/variables/sorting_options.dart';
import 'package:meatingless/variables/sorting_variables.dart';
import 'package:meatingless/widgets/general/element_title.dart';

class FilteredItemsView extends ConsumerStatefulWidget {
  const FilteredItemsView({super.key, required this.filter});
  final FilterOptions filter;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilteredItemsViewState();
}

class _FilteredItemsViewState extends ConsumerState<FilteredItemsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ElementTitle(
              title: "${SortingVariables.mapOfTitles[widget.filter]!}s"),
        )
      ],
    );
  }
}
