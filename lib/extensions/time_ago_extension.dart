import 'package:date_time_converter/utils/date_time_utils.dart';
import 'package:flutter/foundation.dart';

/// Extension to provide a unified timeAgo string from either a [DateTime] or [String] date input.
extension TimeAgoExtension on Object? {
  /// Converts [DateTime] or [String] to a human-readable relative time like '2 hours ago'.
  /// Returns null if the input is null or not a valid type.
  String? get toTimeAgo {
    if (this == null) return null;

    if (this is DateTime) {
      return TimeUtils.timeAgo(this as DateTime);
    }

    if (this is String) {
      try {
        final parsedDate = TimeUtils.stringToDateTime(this as String);
        return TimeUtils.timeAgo(parsedDate);
      } catch (e) {
        if (kDebugMode) {
          print('Failed to parse date string: $e');
        }
        return null;
      }
    }

    return null;
  }
}
