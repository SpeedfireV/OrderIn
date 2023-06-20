import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomAppBarPositionNotifier extends StateNotifier<int> {
  BottomAppBarPositionNotifier() : super(1);

  void changePosition(int newPosition) {
    state = newPosition;
  }
}

final bottomAppBarPositionProvider =
    StateNotifierProvider<BottomAppBarPositionNotifier, int>((ref) {
  return BottomAppBarPositionNotifier();
});
