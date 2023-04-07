import 'package:empat_app/models/dtos/condition_dto.dart';
import 'package:empat_app/models/day.dart';
import 'package:empat_app/models/hour.dart';
import 'package:empat_app/models/dtos/hour_dto.dart';
import 'package:empat_app/models/location.dart';
import 'package:empat_app/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';

import 'day_dto.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherDto {
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "temp_f")
  final double tempF;
  @JsonKey(name: "feelslike_c")
  final double feelsLikeC;
  @JsonKey(name: "feelslike_f")
  final double feelsLikeF;
  final ConditionDto condition;
  @JsonKey(name: "wind_mph")
  final double windMph;
  @JsonKey(name: "wind_kph")
  final double windKph;
  @JsonKey(name: "wind_degree")
  final int windDegree;
  final int humidity;
  final Location location;
  final List<HourDto> hours;
  final List<DayDto> days;

  WeatherDto({
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

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);

  Future<Weather> toWeather() async {
    return Weather(
      tempC: tempC,
      tempF: tempF,
      feelsLikeC: feelsLikeC,
      feelsLikeF: feelsLikeF,
      condition: await condition.toCondition(),
      windMph: windMph,
      windKph: windKph,
      windDegree: windDegree,
      humidity: humidity,
      location: location,
      hours: await hours.toHours(),
      days: await days.toDays(),
    );
  }
}
