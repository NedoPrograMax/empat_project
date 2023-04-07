import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

class Uint8Converter extends JsonConverter<Uint8List, List<int>> {
  const Uint8Converter();
  @override
  Uint8List fromJson(List<int> json) {
    Uint8List bytes = Uint8List.fromList(json);
    return bytes;
  }

  @override
  List<int> toJson(Uint8List object) => object;
}
