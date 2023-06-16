String price(int number) {
  String numberString = number.toString();
  int numberLength = numberString.length;
  if (numberLength > 2) {
    return "${numberString.substring(0, numberLength - 2)}.${numberString.substring(numberLength - 2)}";
  } else if (numberLength == 2) {
    return "0.$number";
  } else {
    return "0.0$number";
  }
}
