String rating(int value) {
  String valueString = value.toString();
  return valueString.length == 2
      ? "${valueString.substring(0, 1)}.${valueString.substring(1)}"
      : "0.${valueString.substring(0)}";
}
