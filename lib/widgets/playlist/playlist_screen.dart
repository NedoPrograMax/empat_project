import 'dart:async';

import 'package:empat_app/models/playlist.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils.dart';
import '../../models/song_route_argument.dart';
import '../../routes/song_routes_generator.dart';
import '../../state/playlist_cubit/playlist_cubit.dart';
import '../../state/playlist_cubit/playlist_cubit_state.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  PlaylistScreen(this.playlist, {super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  StreamSubscription<int?>? lastSubscriber;

  @override
  void dispose() {
    lastSubscriber?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator(
      key: navigatorKey,
      onGenerateRoute: SongRoutesGenerator(
              context.read<PlaylistCubit>().currentSong,
              widget.playlist,
              Navigator.of(context).pop)
          .generateRoute,
      initialRoute: SongRoutesGenerator.defaultRoute,
    );

    return BlocListener<PlaylistCubit, PlaylistCubitState>(
      listenWhen: (previous, current) {
        if (current.currentSongStream != previous.currentSongStream ||
            (current.currentSongStream != null &&
                context.read<PlaylistCubit>().isNewPlaylist)) {
          lastSubscriber?.cancel();

          return true;
        }
        return false;
      },
      listener: (_, state) {
        lastSubscriber = state.currentSongStream?.listen(
          (index) {
            if (index != null &&
                context.mounted &&
                !context.read<PlaylistCubit>().isNewPlaylist) {
              navigatorKey.currentState?.pushNamed(
                SongRoutesGenerator.initialRoute,
                arguments: SongRouteArgument(
                  song: state.songs[index],
                  isForward: isForward(
                      context.read<PlaylistCubit>().state.currentSongIndex,
                      index,
                      state.songs.length),
                ),
              );

              context.read<PlaylistCubit>().setCurrentSongIndex(index);
            }
          },
        );
      },
      child: Scaffold(body: navigator),
    );
  }
}
