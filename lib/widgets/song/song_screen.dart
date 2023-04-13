import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'song_screen_content.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaylistCubit, PlaylistCubitState>(
        listenWhen: (previous, current) => current.whereToNavigate != null,
        listener: (context, state) {
          if (state.whereToNavigate != null) {
            context
                .read<PlaylistCubit>()
                .navigateTo(state.whereToNavigate!, context);
          }
        },
        child: const SongScreenContent());
  }
}
