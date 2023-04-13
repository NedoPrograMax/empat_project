import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';
import 'package:empat_app/widgets/song/duration_slider_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DurationSlider extends HookWidget {
  const DurationSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistCubitState>(
      builder: (context, state) => DurationSliderContent(
        songDurationStream: state.songDuration,
        currentPositionStream: state.durationStream,
      ),
    );
  }
}
