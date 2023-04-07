import 'package:empat_app/models/enums/degree_types.dart';
import 'package:empat_app/models/dtos/weather_dto.dart';

import '../../models/weather.dart';

abstract class AppState {
  final String? errorMessage;
  final bool isLoading;
  final DegreeTypes degreeType;
  const AppState(
      {this.errorMessage, required this.isLoading, required this.degreeType});
}

class MainState extends AppState {
  final Weather? weather;
  MainState({
    this.weather,
    super.errorMessage,
    super.isLoading = false,
    super.degreeType = DegreeTypes.Metric,
  });
}
