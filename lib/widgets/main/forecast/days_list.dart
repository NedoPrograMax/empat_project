import 'package:empat_app/core/extensions.dart';
import 'package:empat_app/state/cubit/day_cubit.dart';
import 'package:empat_app/state/cubit/day_state.dart';
import 'package:empat_app/models/day.dart';
import 'package:empat_app/widgets/main/forecast/day_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysList extends StatelessWidget {
  final List<Day> days;
  const DaysList(this.days, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayCubit, DayState>(
      builder: (context, state) => Expanded(
        flex: 3,
        child: ListView.builder(
          itemCount: days.length,
          itemBuilder: (context, index) => DayItem(
            days[index],
            isChosen:
                days[index].time.secondsToDateTime().isTheSameDay(state.day),
          ),
        ),
      ),
    );
  }
}
