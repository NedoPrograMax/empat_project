class FailContinueTapsProvider {
  int _failedTaps = 0;

  int get failedTaps => _failedTaps;

  void inrement() => _failedTaps++;

  void reset() => _failedTaps = 0;
}
