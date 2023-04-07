// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourDto _$HourDtoFromJson(Map<String, dynamic> json) => HourDto(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition:
          ConditionDto.fromJson(json['condition'] as Map<String, dynamic>),
      time: json['time_epoch'] as int,
    );

Map<String, dynamic> _$HourDtoToJson(HourDto instance) => <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition.toJson(),
      'time_epoch': instance.time,
    };
