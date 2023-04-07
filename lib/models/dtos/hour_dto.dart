import 'package:empat_app/models/condition.dart';
import 'package:empat_app/models/dtos/condition_dto.dart';
import 'package:empat_app/models/hour.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hour_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HourDto {
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "temp_f")
  final double tempF;
  final ConditionDto condition;
  @JsonKey(name: "time_epoch")
  final int time;

  HourDto({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.time,
  });

  factory HourDto.fromJson(Map<String, dynamic> json) =>
      _$HourDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HourDtoToJson(this);

  Future<Hour> toHour() async {
    final newCondition = await condition.toCondition();
    return Hour(
      tempC: tempC,
      tempF: tempF,
      condition: newCondition,
      time: time,
    );
  }
}

extension HourConverter on List<HourDto> {
  Future<List<Hour>> toHours() async {
    final futuresOfHours = map((hourDto) async {
      return await hourDto.toHour();
    }).toList();
    final List<Hour> hours = await Future.wait(futuresOfHours);
    return hours;
  }
}
