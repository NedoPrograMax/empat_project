import 'package:empat_app/models/condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable(explicitToJson: true)
class Day {
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
  final Condition condition;
  @JsonKey(name: "date_epoch")
  final int time;

  Day({
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

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
