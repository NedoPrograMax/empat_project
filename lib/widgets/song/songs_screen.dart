import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/song_routes_generator.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator(
      onGenerateRoute:
          SongRoutesGenerator(context.read<PlaylistCubit>().currentSong)
              .generateRoute,
      initialRoute: SongRoutesGenerator.initialRoute,
    );
    return BlocBuilder<PlaylistCubit, PlaylistCubitState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: state.songs[state.currentSongIndex].mainColor,
          elevation: 0,
        ),
        body: navigator,
      ),
      buildWhen: (previous, current) =>
          previous.currentSongIndex != current.currentSongIndex,
    );
  }
}
