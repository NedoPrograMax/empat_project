import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/playlist_cubit/playlist_cubit.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 60,
      onPressed: () => context.read<PlaylistCubit>().goToNextSong(),
      icon: const Icon(
        Icons.skip_next,
        size: 60,
      ),
    );
  }
}
