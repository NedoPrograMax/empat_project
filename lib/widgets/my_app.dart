import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:empat_app/widgets/main/initial_screen.dart';

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPrefsFuture =
        useMemoized(() => SharedPreferences.getInstance());
    final prefs = useFuture(sharedPrefsFuture);
    if (prefs.hasData) {
      final isLightTheme = prefs.data!.getBool("isLightTheme") ?? false;

      return ThemeProvider(
        duration: const Duration(milliseconds: 300),
        initTheme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
        builder: (p0, theme) => MaterialApp(
          theme: theme,
          initialRoute: "/",
          routes: {
            "/": (_) => const InitialScreen(),
          },
        ),
      );
    }
    return Container();
  }
}
