import 'package:date_format/date_format.dart';

import '../date_time_converter.dart';

class DateUtilsDateFormatImpl extends IDateUtils {
  @override
  String convertDateToString(DateTime date, {List<String>? formats}) =>
      formatDate(
          date,
          formats ??
              <String>[dd, '-', mm, '-', yy, ', ', HH, ':', nn, ' ', am]);

  @override
  String convertDateToStringTime(DateTime date) =>
      formatDate(date, <String>[hh, ':', nn, ' ', am]);
// formatDate(date, <String>[HH, ':', nn, ' ', am]);
}
