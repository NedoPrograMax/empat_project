import 'package:empat_app/core/extensions.dart';

String dayOfWeekFromSeconds(int seconds) {
  final date = seconds.secondsToDateTime();
  final day = date.weekday;
  return day.dayOfWeek();
}

String hourFromSeconds(int seconds) {
  final date = seconds.secondsToDateTime();
  final hour = date.hour;
  var result = hour.toString();
  if (hour < 10) {
    result = "0$result";
  }
  return "$result:00";
}

double getWind(int windDirection, double compas) {
  compas = -compas;
  final relativeWind = windDirection + 180;
  final difference = relativeWind + compas;
  final rotated = difference - 90;
  final converted = rotated / 360;
  return converted.remainder(1);
}
