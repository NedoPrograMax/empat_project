import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:empat_app/core/extensions.dart';

class DurationSliderContent extends HookWidget {
  final Stream<Duration?> songDurationStream;
  final Stream<Duration> currentPositionStream;
  const DurationSliderContent({
    required this.songDurationStream,
    required this.currentPositionStream,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final songDuration = useStream(songDurationStream);
    final currentPosition = useStream(currentPositionStream);
    if (songDuration.hasData && currentPosition.hasData) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(currentPosition.data!.textTime),
                Text(songDuration.data!.textTime),
              ],
            ),
          ),
          Slider(
            max: songDuration.data!.inSeconds.toDouble(),
            value: currentPosition.data!.inSeconds.toDouble(),
            onChanged: (value) => context.read<PlaylistCubit>().setDuration(
                  Duration(seconds: value.toInt()),
                ),
          ),
        ],
      );
    }
    return Slider(
      value: 0,
      onChanged: (value) => null,
    );
  }
}
