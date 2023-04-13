import 'package:empat_app/core/constants.dart';

import 'package:empat_app/models/song.dart';
import 'package:empat_app/models/song_route_argument.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';
import 'package:empat_app/widgets/song/previous_button.dart';
import 'package:empat_app/widgets/square_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../routes/song_routes_generator.dart';
import 'duration_slider.dart';
import 'forward_button.dart';
import 'play_button.dart';

class SongScreenContent extends HookWidget {
  const SongScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    final Song song = (arguments as SongRouteArgument).song;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final dominantColor = song.mainColor ?? surfaceColor;

    return BlocListener<PlaylistCubit, PlaylistCubitState>(
      key: const ValueKey(131),
      listenWhen: (previous, current) => current.whereToNavigate != null,
      listener: (context, state) {
        if (state.whereToNavigate != null) {
          /*    context
              .read<PlaylistCubit>()
              .navigateTo(state.whereToNavigate!, context); */
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              dominantColor,
              dominantColor.withAlpha(200),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ]),
                child: SquareImage(
                  "",
                  width * 0.9,
                  imageProvider: song.image,
                ),
              ),
              const SizedBox(height: 26),
              Text(
                song.title,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 8),
              Text(
                song.band,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 26),
              const DurationSlider(),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  PreviousButton(),
                  SizedBox(width: 16),
                  PlayButton(size: 60),
                  SizedBox(width: 16),
                  ForwardButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
