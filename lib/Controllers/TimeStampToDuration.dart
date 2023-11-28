Duration parseDuration(String timeString) {
  List<String> parts = timeString.split(':');

  // Extract hours, minutes, and seconds
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  // Extract seconds and fraction of a second
  List<String> secondsAndFraction = parts[2].split('.');
  int seconds = int.parse(secondsAndFraction[0]);
  int milliseconds =
      (double.parse("0.${secondsAndFraction[1]}") * 1000).round();

  // Create a Duration object
  Duration duration = Duration(
    hours: hours,
    minutes: minutes,
    seconds: seconds,
    milliseconds: milliseconds,
  );

  return duration;
}
