import 'package:empat_app/models/song.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/routes_generator.dart';
import '../square_image.dart';

class SongItem extends StatelessWidget {
  final Song song;
  final int index;
  const SongItem(this.song, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<PlaylistCubit>().setCurrentSongIndex(index);
          Navigator.of(context).pushNamed(
            RoutesGenerator.songRoute,
            arguments: song,
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
                      "",
                      70,
                      margin: const EdgeInsets.only(right: 10),
                      imageProvider: song.image,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          song.band,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                /*  Row(
                  children: const [
                    Icon(Icons.favorite),
                    SizedBox(width: 20),
                    Icon(Icons.more_vert),
                  ],
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
