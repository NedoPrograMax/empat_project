import 'package:empat_app/widgets/main/main_screen.dart';
import 'package:empat_app/widgets/movie/movie_screen.dart';
import 'package:empat_app/widgets/movies/movies_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // static const String mainScreen = "/";
  static const String mainScreen = "/";
  static const String moviesScreen = "/movies";
  static const String movieScreen = "/movie";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case moviesScreen:
        return MaterialPageRoute(
          builder: (_) => const MoviesScreen(),
        );
      case movieScreen:
        return MaterialPageRoute(
          builder: (_) => const MovieScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
    }
  }
}
