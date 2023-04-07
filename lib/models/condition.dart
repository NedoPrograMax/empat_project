import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

import '../core/conventors.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  final String text;

  @Uint8Converter()
  final Uint8List icon;

  const Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
