import 'package:empat_app/widgets/music_navigation.dart';
import 'package:empat_app/widgets/playlist/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'about_screen.dart';
import 'playlists/playlists_screen.dart';

class NavigatorScreen extends StatelessWidget {
  final ValueNotifier<int> currentIndex;
  const NavigatorScreen(this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex.value,
      children: const [
        MusicNavigation(),
        AboutScreen(),
      ],
    );
  }
}
