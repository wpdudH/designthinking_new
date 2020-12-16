void sortDay(List<String> timeTable) {
  timeTable.sort((a, b) => a.compareTo(b));
}

String CompareDate(String time) {
  DateTime Time = DateTime.parse(time);
  DateTime date2 = DateTime.now();
  int difference = Time.difference(date2).inDays;
  return difference.toString();
}
