String dateToString(DateTime date) {
  String days = date.day.toString();
  String months = date.month.toString();
  String minutes = date.minute.toString();
  String hours = date.hour.toString();

  if (days.length == 1) {
    days = "0$days";
  }
  if (months.length == 1) {
    months = "0$months";
  }
  if (minutes.length == 1) {
    minutes = "0$minutes";
  }
  if (hours.length == 1) {
    hours = "0$hours";
  }
  return "$days.$months.${date.year} | $hours:$minutes";
}
