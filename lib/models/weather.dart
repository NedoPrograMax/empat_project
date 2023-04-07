import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';
import 'day.dart';
import 'hour.dart';
import 'location.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class Weather {
  final double tempC;

  final double tempF;

  final double feelsLikeC;

  final double feelsLikeF;

  final Condition condition;

  final double windMph;

  final double windKph;

  final int windDegree;

  final int humidity;

  final Location location;
  final List<Hour> hours;

  final List<Day> days;

  Weather({
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.humidity,
    required this.location,
    required this.hours,
    required this.days,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
