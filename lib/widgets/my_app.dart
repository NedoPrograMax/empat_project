import 'package:empat_app/providers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
