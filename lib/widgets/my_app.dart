import 'package:empat_app/providers/steppers_provider.dart';
import 'package:empat_app/providers/students_provider.dart';
import 'package:empat_app/routes/routes.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/student_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SteppersProvider(),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RouteGenerator.mainScreen,
      ),
    );
  }
}
