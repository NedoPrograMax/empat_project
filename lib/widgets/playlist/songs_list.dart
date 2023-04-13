import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';
import 'package:empat_app/widgets/playlist/song_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/song.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistCubitState>(
      builder: (context, state) => SliverAnimatedList(
        key: ValueKey(state),
        initialItemCount: state.songs.length,
        itemBuilder: (context, index, animation) =>
            SongItem(state.songs[index], index),
      ),
      buildWhen: (previous, current) =>
          previous.songs.length != current.songs.length,
    );
  }
}
