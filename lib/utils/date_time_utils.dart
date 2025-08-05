import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class TimeUtils {
  static String convertTimeStampToString(String time) =>
      formatDateAsTimeAndDay(getDateTimeFromServerTimeStamp(time as Timestamp));

  static DateTime? getDateTimeFromServerTimeStamp(Timestamp serverTimestamp) =>
      serverTimestamp.toDate();

  static int getDelayInDays({required DateTime startAt}) {
    final DateTime currentTime = DateTime.now();

    final Duration duration = currentTime.difference(startAt);
    debugPrint('Time Duration: ${duration.inDays} Days');

    return duration.inDays;
  }

  static DateTime stringToDateTime(String dateString) =>
      DateTime.parse(dateString);

  static String parseStringToDateAsTimeAndDay(String? dateString) =>
      dateString != null
      ? formatDateAsTimeAndDay(DateTime.parse(dateString))
      : '';

  static String formatDateAsTimeAndDay(DateTime? date) {
    if (date != null) {
      final String day = formatDateAsDay(date);
      return day == "Today"
          ? dateToString(date, formats: <String>[h, ':', nn, ' ', am])
          : day;
    }
    return "";
  }

  static String formatDateAsDayWithRemoveToday(DateTime date) {
    final String day = formatDateAsDay(date);
    return day == "Today" ? '' : ', $day';
  }

  static String formatDateAsDay(DateTime? tm) {
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
        month = "Jan";
        break;
      case 2:
        month = "Feb";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Apr";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "Jun";
        break;
      case 7:
        month = "Jul";
        break;
      case 8:
        month = "Aug";
        break;
      case 9:
        month = "Sep";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
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
          return "Mon";
        case 2:
          return "Tue";
        case 3:
          return "Wed";
        case 4:
          return "Thu";
        case 5:
          return "Fri";
        case 6:
          return "Sat";
        case 7:
          return "Sun";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    } else {
      return '${tm.day} $month ${tm.year % 100}';
      // return '${tm.day} $month ${tm.year % 100}';
    }
    return "";
  }

  static String dateToString(DateTime date, {List<String>? formats}) =>
      formatDate(
        date,
        formats ?? <String>[dd, '-', mm, '-', yy, ', ', HH, ':', nn, ' ', am],
      );

  static String dateToStringTime(DateTime date) =>
      formatDate(date, <String>[hh, ':', nn, ' ', am]);

  // formatDate(date, <String>[HH, ':', nn, ' ', am]);

  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      // return '${difference.inHours} hours ago';
      return DateFormat('h:mm a').format(dateTime); // 12:20 PM
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return DateFormat('EEE').format(dateTime); // Mon, Tue, etc.
    } else if (now.year == dateTime.year) {
      return DateFormat('EEE, d MMM').format(dateTime); // Mon, 12 Jul
    } else {
      return DateFormat('d MMM yyyy').format(dateTime); // 12 Jul 2024
    }
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime); // 12:20 PM
  }

  // void main() {
  //   DateTime dateTime = DateTime.parse("2024-08-25T02:20:00.799539");
  //
  //   // Get a human-readable time ago string
  //   String timeAgoString = timeAgo(dateTime);
  //   print(timeAgoString); // Output will vary based on current time
  //
  //   // Get a formatted time string
  //   String timeString = formatTime(dateTime);
  //   print(timeString); // Output: 2:20 AM
  // }
}
