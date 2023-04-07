import 'package:empat_app/state/bloc/app_bloc.dart';
import 'package:empat_app/state/bloc/app_state.dart';
import 'package:empat_app/models/enums/degree_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentTemperatureColumn extends StatelessWidget {
  const CurrentTemperatureColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        final isMetric = state.degreeType == DegreeTypes.Metric;
        final weather = (state as MainState).weather;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${isMetric ? weather?.tempC : weather?.tempF}°",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              "Feels like ${isMetric ? weather?.feelsLikeC : weather?.feelsLikeF}°",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        );
      },
      buildWhen: (previous, current) {
        final areChanges = (previous as MainState).weather?.feelsLikeC !=
            (current as MainState).weather?.feelsLikeC;
        return areChanges || previous.degreeType != current.degreeType;
      },
    );
  }
}
