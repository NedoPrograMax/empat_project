import 'package:flutter/material.dart';

import 'constants.dart';

extension Normalization on num {
  num normalized(
    num selfRangeMin,
    num selfRangMax, [
    num normalizedRangMin = 0.0,
    num normalizedRangeMax = 1.0,
  ]) =>
      (normalizedRangeMax - normalizedRangMin) *
          ((this - selfRangeMin) / (selfRangMax - selfRangeMin)) +
      normalizedRangMin;
}

GlobalKey<FormState>? getFormKeyById(int id) {
  switch (id) {
    case 0:
      return nameForm;
    case 1:
      return universityForm;
    default:
      return null;
  }
}
