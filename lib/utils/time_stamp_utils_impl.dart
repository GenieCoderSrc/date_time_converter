import 'package:cloud_firestore/cloud_firestore.dart';

import '../date_time_converter.dart';

class TimeStampUtilsImpl extends FormatDateUtilsDateFormatImpl
    implements ITimeStampUtils {
  @override
  DateTime? convertDateTimeToTimeStamp(Timestamp timestamp) =>
      timestamp.toDate();

  @override
  String convertTimeStampToString(String time) =>
      formatDateAsTimeAndDay(convertDateTimeToTimeStamp(time as Timestamp));
}
