import 'package:bloc/bloc.dart';
import 'package:empat_app/core/extensions.dart';
import 'package:empat_app/state/cubit/day_state.dart';
import 'package:empat_app/models/hour.dart';

class DayCubit extends Cubit<DayState> {
  final List<Hour> _hours;
  DayCubit(this._hours)
      : super(
          DayState(
              day: DateTime.now(), hours: _hours.getWithDay(DateTime.now())),
        );

  selectDay(DateTime day) {
    final hours = _hours.getWithDay(day);
    emit(DayState(day: day, hours: hours));
  }
}
