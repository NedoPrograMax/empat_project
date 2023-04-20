import 'package:empat_app/models/playlist.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'bar_header.dart';
import 'listen_button.dart';

class PlaylistAppBar extends StatelessWidget {
  final Playlist playlist;
  final VoidCallback goBack;
  const PlaylistAppBar(this.playlist, this.goBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: goBack,
        icon: const Icon(Icons.arrow_back),
      ),
      backgroundColor: surfaceColor,
      shadowColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      expandedHeight: 375,
      flexibleSpace: BarHeader(playlist),
      bottom: const ListenButton(),
      pinned: true,
    );
  }
}
