extension Tarife on DateTime {
  bool get isWorkDay => weekday >= 1 && weekday <= 5;
  bool get isSaturday => weekday == DateTime.saturday;
  bool get isSunday => weekday == DateTime.sunday;
  String get dayText {
    if (isWorkDay) return "Hafta içi";
    if (isSaturday) return "Cumartesi";
    if (isSunday) return "Pazar";
    return "";
  }

  int get tarifeDay {
    if (isWorkDay) return 1;
    if (isSaturday) return 2;
    if (isSunday) return 3;
    return 1;
  }
}
