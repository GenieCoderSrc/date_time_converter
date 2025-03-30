import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';

import '../date_time_converter.dart';

class FormatDateUtilsDateFormatImpl extends DateUtilsDateFormatImpl
    implements IFormatDateUtils {
  @override
  String formatDateAsDayWeekMonth(DateTime? tm) {
    if (tm == null) {
      debugPrint('formatDateAsDay | tm: $tm');
      return '';
    }

    final DateTime today = DateTime.now();
    // Duration oneDay = new Duration(days: 1);
    const Duration twoDay = Duration(days: 2);
    debugPrint('Today: ${today.day} and TM day: ${tm.day}');
    // int dateDiff = today.day - tm.day;

    const Duration oneWeek = Duration(days: 7);
    String? month;
    switch (tm.month) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }

    final Duration difference = today.difference(tm);
    debugPrint('Today: ${today.day} and TM day: ${tm.day}');

    if (today.day == tm.day) {
      // return "Today";
      return "";
    } else if (difference.compareTo(twoDay) < 1) {
      return "Yesterday";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Monday";
        case 2:
          return "Tuesday";
        case 3:
          return "Wednesday";
        case 4:
          return "Thursday";
        case 5:
          return "Friday";
        case 6:
          return "Saturday";
        case 7:
          return "Sunday";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    } else {
      return '${tm.day} $month ${tm.year}';
    }
    return "";
  }

  @override
  String formatDateAsTimeAndDay(DateTime? date) => date != null
      ? '${convertDateToString(date, formats: <String>[
              h,
              ':',
              nn,
              ' ',
              am
            ])} ${formatDateAsDayWeekMonth(date)}'
      : '';
}
