import 'package:empat_app/models/day.dart';
import 'package:empat_app/models/hour.dart';

class DayState {
  const DayState({
    required this.day,
    required this.hours,
  });
  final DateTime day;
  final List<Hour> hours;
}
