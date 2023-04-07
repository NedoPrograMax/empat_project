import 'package:empat_app/state/cubit/day_cubit.dart';
import 'package:empat_app/state/cubit/day_state.dart';
import 'package:empat_app/models/hour.dart';
import 'package:empat_app/widgets/main/forecast/hour_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoursList extends StatelessWidget {
  const HoursList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayCubit, DayState>(
      builder: (context, state) => Flexible(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: state.hours.length,
          itemBuilder: (context, index) => HourItem(state.hours[index]),
        ),
      ),
    );
  }
}
