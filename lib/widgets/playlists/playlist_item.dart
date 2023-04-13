import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/state/app_cubit/app_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/widgets/playlist/playlist_screen.dart';
import 'package:empat_app/widgets/song/play_button.dart';
import 'package:empat_app/widgets/square_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;
  const PlaylistItem(this.playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<PlaylistCubit>().setNewSongs(playlist.songs);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlaylistScreen(playlist),
            ),
          );
        },
        child: Ink(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade800,
                width: 0.5,
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SquareImage(
                      playlist.imageUrl,
                      70,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          playlist.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          playlist.author,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    PlayButton(
                      size: 30,
                      beforePlay: () => context
                          .read<PlaylistCubit>()
                          .setNewSongs(playlist.songs),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
