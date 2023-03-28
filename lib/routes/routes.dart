import 'package:empat_app/widgets/info/info_screen.dart';
import 'package:empat_app/widgets/main/main_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String mainScreen = '/';
  static const String infoScreen = '/info';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case infoScreen:
        return MaterialPageRoute(
          builder: (_) => const InfoScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Text("Shouldn't happen..."),
        );
    }
  }
}
