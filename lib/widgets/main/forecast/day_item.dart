import 'package:empat_app/state/bloc/app_bloc.dart';
import 'package:empat_app/state/bloc/app_state.dart';
import 'package:empat_app/core/extensions.dart';
import 'package:empat_app/core/utils.dart';
import 'package:empat_app/state/cubit/day_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/day.dart';
import '../../../models/enums/degree_types.dart';

class DayItem extends StatelessWidget {
  final Day day;
  final bool isChosen;
  const DayItem(
    this.day, {
    required this.isChosen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () =>
              context.read<DayCubit>().selectDay(day.time.secondsToDateTime()),
          child: Ink(
            child: Container(
              decoration: BoxDecoration(
                border: isChosen ? Border.all() : null,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text(
                    dayOfWeekFromSeconds(day.time),
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  BlocBuilder<AppBloc, AppState>(
                    buildWhen: (previous, current) =>
                        previous.degreeType != current.degreeType,
                    builder: (context, state) {
                      final isMetric = state.degreeType == DegreeTypes.Metric;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.memory(day.condition.icon),
                          const SizedBox(width: 12),
                          Expanded(child: Text(day.condition.text)),
                          const Icon(Icons.thunderstorm_outlined),
                          const SizedBox(width: 3),
                          Text(
                            "${day.rainChance}%",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${isMetric ? day.avgTempC : day.avgTempF}°",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 40,
                            child: Column(
                              children: [
                                Text(
                                  "${isMetric ? day.maxTempC : day.maxTempF}°",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "${isMetric ? day.minTempC : day.minTempF}°",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
