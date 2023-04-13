import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlayButton extends HookWidget {
  final double size;
  final Future<void> Function()? beforePlay;
  const PlayButton({required this.size, this.beforePlay, super.key});

  @override
  Widget build(BuildContext context) {
    final buttonAnimation = useAnimationController(
        duration: const Duration(milliseconds: 300), initialValue: 1);
    useEffect(() {
      final sunscriber =
          context.read<PlaylistCubit>().state.isPlaying.listen((isPlaying) {
        if (isPlaying) {
          buttonAnimation.reverse();
        } else {
          buttonAnimation.forward();
        }
      });
      return () => sunscriber.cancel();
    });

    return IconButton(
      iconSize: size,
      onPressed: () async {
        if (context.read<PlaylistCubit>().state.songs.isEmpty &&
            beforePlay != null) {
          await beforePlay!();
        }

        context.read<PlaylistCubit>().playOrPause();
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.pause_play,
        progress: buttonAnimation,
        size: size,
      ),
    );
  }
}
