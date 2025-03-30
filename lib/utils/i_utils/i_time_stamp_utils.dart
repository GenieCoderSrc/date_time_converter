import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ITimeStampUtils {
  String convertTimeStampToString(String time);

  DateTime? convertDateTimeToTimeStamp(Timestamp timestamp);
}
