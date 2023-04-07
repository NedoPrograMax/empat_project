import 'package:empat_app/state/bloc/app_events.dart';
import 'package:empat_app/widgets/my_app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state/bloc/app_bloc.dart';
import 'models/enums/degree_types.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  final prefs = await SharedPreferences.getInstance();
  final degreeType = DegreeTypes.values[prefs.getInt("degreeType") ?? 1];
  runApp(
    BlocProvider<AppBloc>(
      create: (context) => AppBloc()
        ..add(const LoadWithLocation())
        ..add(ChangeDegreeType(degreeType)),
      child: const MyApp(),
    ),
  );
}
