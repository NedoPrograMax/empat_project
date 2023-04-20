import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/song_routes_generator.dart';

class SongsScreen extends StatelessWidget {
  SongsScreen({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistCubitState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: state.songs[state.currentSongIndex].mainColor,
          elevation: 0,
        ),
      ),
    );
  }
}
