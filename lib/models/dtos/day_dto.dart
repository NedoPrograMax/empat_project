import 'package:empat_app/models/condition.dart';
import 'package:empat_app/models/dtos/condition_dto.dart';
import 'package:empat_app/models/day.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DayDto {
  @JsonKey(name: "maxtemp_c")
  final double maxTempC;
  @JsonKey(name: "maxtemp_f")
  final double maxTempF;
  @JsonKey(name: "mintemp_c")
  final double minTempC;
  @JsonKey(name: "mintemp_f")
  final double minTempF;
  @JsonKey(name: "avgtemp_c")
  final double avgTempC;
  @JsonKey(name: "avgtemp_f")
  final double rainChance;
  @JsonKey(name: "daily_chance_of_rain")
  final double avgTempF;
  final ConditionDto condition;
  @JsonKey(name: "date_epoch")
  final int time;

  DayDto({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.rainChance,
    required this.avgTempF,
    required this.condition,
    required this.time,
  });

  factory DayDto.fromJson(Map<String, dynamic> json) => _$DayDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DayDtoToJson(this);

  Future<Day> toDay() async {
    final newCondition = await condition.toCondition();
    return Day(
      maxTempC: maxTempC,
      maxTempF: maxTempF,
      minTempC: minTempC,
      minTempF: minTempF,
      avgTempC: avgTempC,
      rainChance: rainChance,
      avgTempF: avgTempF,
      condition: newCondition,
      time: time,
    );
  }
}

extension DaysConverter on List<DayDto> {
  Future<List<Day>> toDays() async {
    final futuresOfDays = map((dayDto) async {
      return await dayDto.toDay();
    });
    final List<Day> days = await Future.wait(futuresOfDays);
    return days;
  }
}
