import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/variables/sorting_options.dart';

class SortingOptionsNotifier extends StateNotifier<FilterOptions> {
  SortingOptionsNotifier() : super(FilterOptions.all);

  void changeOption(FilterOptions newOption) {
    state = newOption;
  }
}

final sortingOptionsProvider =
    StateNotifierProvider<SortingOptionsNotifier, FilterOptions>((ref) {
  return SortingOptionsNotifier();
});
