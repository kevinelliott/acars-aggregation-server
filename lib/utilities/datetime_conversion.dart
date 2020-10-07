class DateTimeConversion {
  static DateTime dateTimeFromEpochUs(double us) => us == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch((us * 1000).toInt());
}
