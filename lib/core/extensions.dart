import 'package:empat_app/models/hour.dart';

extension JsonConverters on List<Map<String, dynamic>> {
  List<dynamic> getHours() {
    final List<dynamic> result = [];
    forEach((value) {
      final List<dynamic> hours = value["hour"];
      result.addAll(hours);
    });
    return result;
  }

  List<dynamic> getDays() {
    final List<dynamic> result = [];
    forEach((value) {
      final Map<String, dynamic> days = value["day"];
      days.putIfAbsent("date_epoch", () => value["date_epoch"]);
      result.add(days);
    });
    return result;
  }
}

extension DateTimeChecker on DateTime {
  bool isTheSameDay(DateTime otherDay) {
    final firstDay = DateTime(year, month, day);
    final secondDay = DateTime(otherDay.year, otherDay.month, otherDay.day);
    return firstDay.isAtSameMomentAs(secondDay);
  }
}

extension IntConverter on int {
  DateTime secondsToDateTime() =>
      DateTime.fromMillisecondsSinceEpoch(this * 1000);

  String dayOfWeek() {
    switch (this) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Secret day";
    }
  }
}

extension DoubleConverter on double? {
  double getRealHeading() {
    if (this == null) return 0;
    if (this! < 0) return 360 + this!;
    if (this! > 0) return this!;
    return this!;
  }
}

extension HoursConerter on List<Hour> {
  getWithDay(DateTime day) {
    final todays =
        where((hour) => hour.time.secondsToDateTime().isTheSameDay(day));
    return todays.where((hour) {
      final difference =
          hour.time.secondsToDateTime().difference(DateTime.now());
      return difference.inMinutes > -60;
    }).toList();
  }
}
