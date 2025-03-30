String intToTime(int timeInMinutes) {
  int hours = timeInMinutes ~/ 60;
  int minutes = timeInMinutes % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

extension TimeFormat on int {
  String toTimeString() {
    int seconds = this % 60;
    int totalMinutes = (this / 60).floor();
    int minutes = totalMinutes % 60;
    int hours = (totalMinutes / 60).floor();

    String hoursString = hours.toString().padLeft(2, '0');
    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = seconds.toString().padLeft(2, '0');

    //HH:mm:ss
    return '$hoursString:$minutesString:$secondsString';
  }
}
