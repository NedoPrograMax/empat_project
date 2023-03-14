import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThemeSwitcherFAB extends StatefulWidget {
  const ThemeSwitcherFAB({super.key});

  @override
  State<ThemeSwitcherFAB> createState() => _ThemeSwitcherFABState();
}

class _ThemeSwitcherFABState extends State<ThemeSwitcherFAB> {
  var isLightTheme = false;

  void _switchTheme(BuildContext context) {
    ThemeSwitcher.of(context).changeTheme(
      theme: isLightTheme ? ThemeData.dark() : ThemeData.light(),
    );
    setState(() {
      isLightTheme = !isLightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (context) => FloatingActionButton(
        onPressed: () => _switchTheme(context),
        child: Icon(isLightTheme ? Icons.dark_mode : Icons.light_mode),
      ),
    );
  }
}
