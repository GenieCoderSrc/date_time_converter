extension DurationFormatting on Duration {
  String formatHoursMinutesSeconds() {
    String formattedTime =
        toString().split('.').first; // Extracts the time part
    List<String> components = formattedTime
        .split(':'); // Splits the time into hours, minutes, and seconds
    String hours = components[0];
    String minutes = components[1];
    String seconds = components[2];
    return '$hours:$minutes:$seconds';
  }
}
