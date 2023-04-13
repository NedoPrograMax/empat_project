import 'package:empat_app/models/playlist.dart';

import 'package:empat_app/widgets/playlist/playlist_app_bar.dart';
import 'package:empat_app/widgets/playlist/songs_list.dart';

import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  final Playlist playlist;
  const PlaylistScreen(this.playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      shrinkWrap: true,
      slivers: [
        PlaylistAppBar(playlist),
        const SongsList(),
      ],
    )
        //,
        );
  }
}
