import 'package:empat_app/state/bloc/app_bloc.dart';
import 'package:empat_app/state/bloc/app_state.dart';
import 'package:empat_app/core/extensions.dart';
import 'package:empat_app/core/utils.dart';
import 'package:empat_app/models/enums/degree_types.dart';
import 'package:empat_app/models/hour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourItem extends StatelessWidget {
  final Hour hour;
  const HourItem(this.hour, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) => Text(
                "${state.degreeType == DegreeTypes.Metric ? hour.tempC : hour.tempF}°",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              buildWhen: (previous, current) =>
                  previous.degreeType != current.degreeType,
            ),
            Image.memory(hour.condition.icon),
            Text(
              hourFromSeconds(hour.time),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
