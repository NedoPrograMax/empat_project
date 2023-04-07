// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      feelsLikeF: (json['feelslike_f'] as num).toDouble(),
      condition:
          ConditionDto.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
      windDegree: json['wind_degree'] as int,
      humidity: json['humidity'] as int,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      hours: (json['hours'] as List<dynamic>)
          .map((e) => HourDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      days: (json['days'] as List<dynamic>)
          .map((e) => DayDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'feelslike_c': instance.feelsLikeC,
      'feelslike_f': instance.feelsLikeF,
      'condition': instance.condition.toJson(),
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'humidity': instance.humidity,
      'location': instance.location.toJson(),
      'hours': instance.hours.map((e) => e.toJson()).toList(),
      'days': instance.days.map((e) => e.toJson()).toList(),
    };
