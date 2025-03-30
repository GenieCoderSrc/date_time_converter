import 'package:flutter/foundation.dart';

import '../date_time_converter.dart';

class DurationUtilsImpl extends IDurationUtils {
  @override
  int calculateDelayInDays({required DateTime startAt}) {
    final DateTime currentTime = DateTime.now();

    final Duration duration = currentTime.difference(startAt);
    debugPrint('Time Duration: ${duration.inDays} Days');

    return duration.inDays;
  }
}
