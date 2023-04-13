import 'package:empat_app/models/song.dart';
import 'package:empat_app/models/song_route_argument.dart';

import 'package:empat_app/widgets/song/song_screen.dart';
import 'package:flutter/material.dart';

class SongRoutesGenerator {
  final Song initialSong;
  const SongRoutesGenerator(this.initialSong);

  static const initialRoute = "/song";
  Route<dynamic> generateRoute(RouteSettings settings) {
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
  }
}
