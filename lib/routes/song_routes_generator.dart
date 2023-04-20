import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/models/song.dart';
import 'package:empat_app/models/song_route_argument.dart';

import 'package:empat_app/widgets/song/song_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/playlist/playlist_app_bar.dart';
import '../widgets/playlist/songs_list.dart';

class SongRoutesGenerator {
  final Song initialSong;
  final Playlist playlist;
  final VoidCallback goBack;
  const SongRoutesGenerator(
    this.initialSong,
    this.playlist,
    this.goBack,
  );

  static const initialRoute = "/song";
  static const defaultRoute = "/";
  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == initialRoute) {
      if (settings.arguments == null) {
        settings = RouteSettings(
          name: settings.name,
          arguments: SongRouteArgument(
            song: initialSong,
            isForward: true,
          ),
        );
      }

      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SongScreen(),
        settings: settings,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final begin = (settings.arguments as SongRouteArgument).isForward
              ? const Offset(1, 0)
              : const Offset(-1, 0);
          final slideTween = Tween(begin: begin, end: Offset.zero);
          final slideAnimation = animation.drive(slideTween);
          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => CustomScrollView(
          shrinkWrap: true,
          slivers: [
            PlaylistAppBar(playlist, goBack),
            const SongsList(),
          ],
        ),
      );
    }
  }
}
