import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlaylistsAppBar extends StatelessWidget {
  const PlaylistsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Playlists"),
      actions: const [
        Icon(Icons.search),
      ],
    );
  }
}
