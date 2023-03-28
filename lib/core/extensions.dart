import 'package:flutter/material.dart';

extension StepCreator on Step {
  copyWithStateAndIsActive(StepState state, bool isActive) => Step(
        title: title,
        content: content,
        state: state,
        isActive: isActive,
      );
}
