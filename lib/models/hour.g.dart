// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      time: json['time_epoch'] as int,
    );

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition.toJson(),
      'time_epoch': instance.time,
    };
