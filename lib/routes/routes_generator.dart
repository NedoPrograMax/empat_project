import 'package:empat_app/widgets/playlists/playlists_screen.dart';

import 'package:flutter/material.dart';

import '../widgets/song/songs_screen.dart';

class RoutesGenerator {
  static const initialRoute = "/";
  static const songRoute = "/songs";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PlaylistsScreen(),
        );
      case songRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SongsScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PlaylistsScreen(),
        );
    }
  }
}
