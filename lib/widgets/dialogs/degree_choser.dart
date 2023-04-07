import 'package:empat_app/state/bloc/app_bloc.dart';
import 'package:empat_app/state/bloc/app_events.dart';
import 'package:empat_app/models/enums/degree_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DegreeChooser extends HookWidget {
  const DegreeChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedPrefsFuture =
        useMemoized(() => SharedPreferences.getInstance());
    final prefs = useFuture(sharedPrefsFuture);
    if (prefs.hasData) {
      final degreeType = useState(
        DegreeTypes.values[prefs.data?.getInt("degreeType") ?? 1],
      );
      degreeType.addListener(() {
        prefs.data?.setInt("degreeType", degreeType.value.index);
        context.read<AppBloc>().add(ChangeDegreeType(degreeType.value));
      });
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            value: DegreeTypes.Metric,
            groupValue: degreeType.value,
            onChanged: (type) => degreeType.value = type ?? DegreeTypes.Metric,
            title: const Text("Metric"),
          ),
          RadioListTile(
            value: DegreeTypes.Imperial,
            groupValue: degreeType.value,
            onChanged: (type) =>
                degreeType.value = type ?? DegreeTypes.Imperial,
            title: const Text("Imperial"),
          ),
        ],
      );
    }
    return Container();
  }
}
