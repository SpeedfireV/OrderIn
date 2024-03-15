import 'dart:ui';

import 'package:payu/payu.dart';

class PayUServices {
  static void initPayU() {
    Payu.pos = const POS(id: '385627');
    Payu.environment = Environment.sandbox;
    Payu.locale = const Locale('pl');
  }
}
