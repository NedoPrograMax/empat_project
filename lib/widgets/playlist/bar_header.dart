import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/models/song.dart';
import 'package:empat_app/state/app_cubit/app_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants.dart';
import '../search_song/search_song_screen.dart';
import 'info_tabs.dart';

class BarHeader extends StatelessWidget {
  final Playlist playlist;
  const BarHeader(this.playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        color: surfaceColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InfoTabs(playlist),
              Text(
                playlist.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
                    final Song? foundSong = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchSongScreen(),
                      ),
                    );
                    if (foundSong != null) {
                      context.read<AppCubit>().updatePlaylist(
                            playlist.addSong(foundSong),
                          );
                      context.read<PlaylistCubit>().addNewSong(foundSong);
                    }
                  },
                  child: Ink(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                        border: Border.all(color: accentColor),
                      ),
                      //   margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "ADD SONGS",
                        style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
