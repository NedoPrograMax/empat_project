// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayDto _$DayDtoFromJson(Map<String, dynamic> json) => DayDto(
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      maxTempF: (json['maxtemp_f'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      minTempF: (json['mintemp_f'] as num).toDouble(),
      avgTempC: (json['avgtemp_c'] as num).toDouble(),
      rainChance: (json['avgtemp_f'] as num).toDouble(),
      avgTempF: (json['daily_chance_of_rain'] as num).toDouble(),
      condition:
          ConditionDto.fromJson(json['condition'] as Map<String, dynamic>),
      time: json['date_epoch'] as int,
    );

Map<String, dynamic> _$DayDtoToJson(DayDto instance) => <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_c': instance.minTempC,
      'mintemp_f': instance.minTempF,
      'avgtemp_c': instance.avgTempC,
      'avgtemp_f': instance.rainChance,
      'daily_chance_of_rain': instance.avgTempF,
      'condition': instance.condition.toJson(),
      'date_epoch': instance.time,
    };
