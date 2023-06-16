import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/variables/sorting_options.dart';

class SortingOptionsNotifier extends StateNotifier<SortingOptions> {
  SortingOptionsNotifier() : super(SortingOptions.all);

  void changeOption(SortingOptions newOption) {
    state = newOption;
  }
}

final sortingOptionsProvider =
    StateNotifierProvider<SortingOptionsNotifier, SortingOptions>((ref) {
  return SortingOptionsNotifier();
});
