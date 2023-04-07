import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChooser extends HookWidget {
  const ThemeChooser({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPrefsFuture =
        useMemoized(() => SharedPreferences.getInstance());
    final prefs = useFuture(sharedPrefsFuture);
    if (prefs.hasData) {
      final isLightTheme =
          useState(prefs.data!.getBool("isLightTheme") ?? false);

      isLightTheme.addListener(() {
        prefs.data!.setBool("isLightTheme", isLightTheme.value);
      });

      return Column(
        children: [
          ThemeSwitcher(
            builder: (context) => IconButton(
              onPressed: () {
                isLightTheme.value = !isLightTheme.value;
                ThemeSwitcher.of(context).changeTheme(
                  theme:
                      isLightTheme.value ? ThemeData.light() : ThemeData.dark(),
                );
              },
              icon: Icon(
                !isLightTheme.value ? Icons.light_mode : Icons.dark_mode,
                size: 40,
              ),
            ),
          ),
          const Text("Switch theme mode")
        ],
      );
    } else {
      return Container();
    }
  }
}
