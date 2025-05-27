# date_time_converter

A Dart package that provides utilities for date and time conversion, formatting, and manipulation. This package includes extensions and helper classes to simplify working with DateTime, Duration, and timestamps.

## Features

- Round DateTime objects up or down to the nearest 10 minutes.
- Format Duration and DateTime objects into readable strings.
- Convert integers to formatted time strings.
- Convert timestamps to DateTime objects and vice versa.
- Parse and format dates into different string representations.
- Calculate delays in days between two dates.
- Format dates as human-readable relative strings (e.g., "Yesterday", "Mon, 12 Jul").

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  date_time_converter: latest_version
```

Then, run:

```sh
flutter pub get
```


## Usage

### Import the package

```dart
import 'package:date_time_converter/date_time_converter.dart';
```

### Rounding DateTime

```dart
DateTime now = DateTime.now();
DateTime roundedUp = now.roundUpToNearestTenMinutes();
DateTime roundedDown = now.roundDownToNearestTenMinutes();
```

### Formatting Duration

```dart
Duration duration = Duration(hours: 2, minutes: 30, seconds: 45);
String formatted = duration.formatHoursMinutesSeconds();
print(formatted); // Output: 02:30:45
```

### Integer to Time String

```dart
int totalSeconds = 3661;
String timeString = totalSeconds.toTimeString();
print(timeString); // Output: 01:01:01
```

### Date Conversion & Formatting

```dart
DateTime now = DateTime.now();
String formattedDate = DateUtilsDateFormatImpl().convertDateToString(now);
print(formattedDate);
```

### Timestamp Conversion

```dart
Timestamp timestamp = Timestamp.now();
DateTime dateTime = TimeStampUtilsImpl().convertDateTimeToTimeStamp(timestamp)!;
```

## Contributions

Contributions are welcome! Feel free to submit a pull request or open an issue.

## License

This package is released under the MIT License.

