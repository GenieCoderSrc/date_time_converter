extension DateTimeRoundingExtension on DateTime {
  DateTime roundDownToNearestTenMinutes() {
    final roundedMinutes = minute -
        (minute % 10); // Round down the minutes to the nearest multiple of 10
    final roundedTime = DateTime(
      year,
      month,
      day,
      hour,
      roundedMinutes,
    );
    return roundedTime;
  }

  DateTime roundUpToNearestTenMinutes() {
    final extraMinutes = 10 - (minute % 10);
    final roundedTime = add(Duration(minutes: extraMinutes));
    return DateTime(
      roundedTime.year,
      roundedTime.month,
      roundedTime.day,
      roundedTime.hour,
      roundedTime.minute,
      0,
    );
  }

  bool isRoundedToTenMinutes() {
    return minute % 10 == 0;
  }

  bool isRoundedToTenMinutesAndFirstSecond() {
    final isRoundedToTenMinutes = minute % 10 == 0;
    final isFirstSecond = second == 0 && millisecond < 1000;
    return isRoundedToTenMinutes && isFirstSecond;
  }

  bool isRoundedToTenMinutesEndTimeAndLastSecond() {
    final isRoundedEndTime =
        minute % 10 == 9 && second == 59 && millisecond == 999;
    return isRoundedEndTime;
  }
}
