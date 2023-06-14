import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomAppBarPositionNotifier extends StateNotifier<String> {
  BottomAppBarPositionNotifier() : super("home");

  void changePosition(String newPosition) {
    state = newPosition;
  }
}

final bottomAppBarPositionProvider =
    StateNotifierProvider<BottomAppBarPositionNotifier, String>((ref) {
  return BottomAppBarPositionNotifier();
});
