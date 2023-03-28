import 'package:empat_app/core/extensions.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';

class SteppersProvider with ChangeNotifier {
  int _currentStep = 0;
  var _steps = [...constantSteps];

  SteppersProvider();

  get currentStep => _currentStep;

  List<Step> get steps => [..._steps];

  void incrementStep() {
    if (_currentStep == _steps.length - 1) {
      return;
    }
    _steps[_currentStep] = _steps[_currentStep].copyWithStateAndIsActive(
      StepState.complete,
      false,
    );

    _currentStep++;

    _steps[_currentStep] = _steps[_currentStep].copyWithStateAndIsActive(
      StepState.editing,
      true,
    );

    notifyListeners();
  }

  void decrementStep() {
    if (_currentStep == 0) {
      return;
    }

    _steps[_currentStep] = _steps[_currentStep].copyWithStateAndIsActive(
      _steps[_currentStep].state == StepState.complete
          ? StepState.complete
          : StepState.indexed,
      false,
    );

    _currentStep--;

    _steps[_currentStep] = _steps[_currentStep].copyWithStateAndIsActive(
      StepState.editing,
      true,
    );
    notifyListeners();
  }

  void reset() {
    _steps = [...constantSteps];
    _currentStep = 0;
  }
}
