import 'package:empat_app/models/dtos/weather_dto.dart';
import 'package:flutter/material.dart';

import '../../../models/weather.dart';
import 'days_list.dart';
import 'hours_list.dart';

class ForecastContent extends StatelessWidget {
  final Weather weather;
  const ForecastContent(this.weather, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        //  mainAxisSize: MainAxisSize.min,
        children: [
          const HoursList(),
          DaysList(weather.days),
        ],
      ),
    );
  }
}
