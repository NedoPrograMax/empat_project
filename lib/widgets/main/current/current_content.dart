import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/weather.dart';
import '../../../state/bloc/app_bloc.dart';
import '../../../state/bloc/app_state.dart';
import '../../../models/enums/degree_types.dart';

import '../../dialogs/wind_dialog.dart';
import 'wind_direction.dart';
import 'current_temperature_column.dart';
import 'location_item.dart';

class CurrentContent extends StatelessWidget {
  const CurrentContent({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LocationItem(weather: weather),
        Image.memory(
          weather.condition.icon,
          scale: 0.5,
        ),
        Text(
          weather.condition.text,
          style: const TextStyle(fontSize: 22),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CurrentTemperatureColumn(),
            Row(
              children: [
                const Icon(Icons.water_drop),
                Text(
                  "${weather.humidity}%",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => WindDialog(weather.windDegree),
              ),
              child: Column(
                children: [
                  WindDirection(weather.windDegree),
                  const SizedBox(height: 2),
                  BlocBuilder<AppBloc, AppState>(
                    buildWhen: (previous, current) {
                      final areChanges =
                          (previous as MainState).weather?.windKph !=
                              (current as MainState).weather?.windKph;
                      return areChanges ||
                          previous.degreeType != current.degreeType;
                    },
                    builder: (context, state) => Text(
                      state.degreeType == DegreeTypes.Metric
                          ? "${weather.windKph} kph"
                          : "${weather.windMph} mph",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
