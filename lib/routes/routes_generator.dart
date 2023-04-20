import 'package:empat_app/widgets/playlists/playlists_screen.dart';
import 'package:empat_app/widgets/song/song_screen.dart';

import 'package:flutter/material.dart';

import '../widgets/song/songs_screen.dart';

class RoutesGenerator {
  static const initialRoute = "/";
  static const songRoute = "/song";
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
          builder: (context) => SongScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PlaylistsScreen(),
        );
    }
  }
}
