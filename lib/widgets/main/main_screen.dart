import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:empat_app/state/cubit/day_cubit.dart';
import 'package:empat_app/models/dtos/weather_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather.dart';
import 'current/current_content.dart';

import 'forecast/forecast_content.dart';
import 'main_fab.dart';

class MainScreen extends StatelessWidget {
  final Weather weather;
  const MainScreen({
    required this.weather,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: MainFAB(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: BlocProvider<DayCubit>(
                create: (context) => DayCubit(weather.hours),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CurrentContent(weather: weather),
                    ForecastContent(weather),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
