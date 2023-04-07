import 'package:empat_app/models/condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hour.g.dart';

@JsonSerializable(explicitToJson: true)
class Hour {
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "temp_f")
  final double tempF;
  final Condition condition;
  @JsonKey(name: "time_epoch")
  final int time;

  Hour({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.time,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
