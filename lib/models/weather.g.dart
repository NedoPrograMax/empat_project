// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      tempC: (json['tempC'] as num).toDouble(),
      tempF: (json['tempF'] as num).toDouble(),
      feelsLikeC: (json['feelsLikeC'] as num).toDouble(),
      feelsLikeF: (json['feelsLikeF'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['windMph'] as num).toDouble(),
      windKph: (json['windKph'] as num).toDouble(),
      windDegree: json['windDegree'] as int,
      humidity: json['humidity'] as int,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      hours: (json['hours'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'tempC': instance.tempC,
      'tempF': instance.tempF,
      'feelsLikeC': instance.feelsLikeC,
      'feelsLikeF': instance.feelsLikeF,
      'condition': instance.condition.toJson(),
      'windMph': instance.windMph,
      'windKph': instance.windKph,
      'windDegree': instance.windDegree,
      'humidity': instance.humidity,
      'location': instance.location.toJson(),
      'hours': instance.hours.map((e) => e.toJson()).toList(),
      'days': instance.days.map((e) => e.toJson()).toList(),
    };
