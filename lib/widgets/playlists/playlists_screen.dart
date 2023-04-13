import 'package:empat_app/widgets/playlists/order_chooser.dart';
import 'package:empat_app/widgets/playlists/playlists_app_bar.dart';
import 'package:empat_app/widgets/playlists/playlists_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'playlist_types.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Playlists"),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PlaylistTypes(),
          OrderChooser(),
          PlaylistsList(),
        ],
      ),
    );
  }
}
