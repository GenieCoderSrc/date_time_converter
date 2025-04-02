import 'package:date_time_converter/date_time_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_converter/extensions/date_time_rounding_extension.dart';
import 'package:date_time_converter/utils/date_converter_impl.dart';

void main() {
  DateTime now = DateTime.now();
  print("Current Time: \$now");

  // Rounding DateTime
  DateTime roundedUp = now.roundUpToNearestTenMinutes();
  DateTime roundedDown = now.roundDownToNearestTenMinutes();
  print("Rounded Up: \$roundedUp");
  print("Rounded Down: \$roundedDown");

  // Checking if rounded
  print("Is rounded to 10 minutes? \${now.isRoundedToTenMinutes()}");

  // Formatting Duration
  Duration duration = Duration(hours: 1, minutes: 45, seconds: 30);
  print("Formatted Duration: \${duration.formatHoursMinutesSeconds()}");

  // Integer to Time String
  int totalSeconds = 3675;
  print("Time String: \${totalSeconds.toTimeString()}");

  // Date Conversion
  DateTime dateFromString = DateConverterImpl().convertStringToDateTime("2024-04-01T14:30:00");
  print("Converted DateTime: \$dateFromString");

  // Timestamp Conversion
  Timestamp timestamp = Timestamp.now();
  DateTime? convertedTimestamp = TimeStampUtilsImpl().convertDateTimeToTimeStamp(timestamp);
  print("Converted Timestamp: \$convertedTimestamp");
}
