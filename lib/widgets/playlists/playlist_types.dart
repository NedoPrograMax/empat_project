import 'package:empat_app/widgets/playlists/playlist_type_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/enums/playlist_type.dart';

class PlaylistTypes extends StatelessWidget {
  const PlaylistTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: ListView.builder(
          itemCount: PlaylistType.values.length,
          itemBuilder: (context, index) =>
              PlaylistTypeItem(PlaylistType.values[index]),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
