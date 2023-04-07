import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:empat_app/models/condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition_dto.g.dart';

@JsonSerializable()
class ConditionDto {
  final String text;
  final String icon;

  const ConditionDto({
    required this.text,
    required this.icon,
  });

  factory ConditionDto.fromJson(Map<String, dynamic> json) =>
      _$ConditionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionDtoToJson(this);

  Future<Condition> toCondition() async {
    final dio = Dio(BaseOptions(
      responseType: ResponseType.bytes,
    ));
    final imageData = await dio.get<Uint8List>("http:" + icon);
    final image = imageData.data ?? Uint8List.fromList([]);
    return Condition(text: text, icon: image);
  }
}
