import 'package:empat_app/core/constants.dart';
import 'package:empat_app/core/extensions.dart';
import 'package:empat_app/models/song_route_argument.dart';
import 'package:empat_app/routes/song_routes_generator.dart';
import 'package:empat_app/state/playlist_cubit/playlist_cubit_state.dart';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../models/song.dart';

class PlaylistCubit extends Cubit<PlaylistCubitState> {
  final AudioPlayer player = AudioPlayer()..setLoopMode(LoopMode.all);
  int previousSongIndex = 0;
  bool isForward = true;
  PlaylistCubit()
      : super(
          PlaylistCubitState(
            songs: [],
            currentSongIndex: 0,
            isPlaying: Stream.value(false),
            durationStream: const Stream.empty(),
            songDuration: Stream.value(const Duration()),
          ),
        ) {
    emit(
      state.copyWith(
        isPlaying: player.playingStream,
        songDuration: player.durationStream,
        durationStream: player.positionStream,
      ),
    );
  }

  void goToNextSong() async {
    isForward = true;
    late final int newIndex;
    if (state.currentSongIndex != state.songs.length - 1) {
      newIndex = state.currentSongIndex + 1;
    } else {
      newIndex = 0;
    }
    await player.seek(const Duration(), index: newIndex);
  }

  void goToPreviousSong() async {
    isForward = false;
    late final int newIndex;
    if (state.currentSongIndex != 0) {
      newIndex = state.currentSongIndex - 1;
    } else {
      newIndex = state.songs.length - 1;
    }
    await player.seek(const Duration(), index: newIndex);
  }

  Future<void> setNewSongs(List<Song> songs) async {
    await songs.setColors();
    final playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: songs.toAudioSources(),
    );
    await player.setAudioSource(
      playlist,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
    player.currentIndexStream.listen(
      (index) {
        if (index != null) {
          emit(
            state.copyWith(
              currentSongIndex: index,
              whereToNavigate: index,
            ),
          );
        }
      },
    );
    emit(
      state.copyWith(songs: songs, currentSongIndex: 0),
    );
  }

  Color get currentColor {
    return currentSong.mainColor ?? surfaceColor;
  }

  Song get currentSong => state.songs[state.currentSongIndex];

  void setCurrentSongIndex(int index) async {
    await player.seek(const Duration(), index: index);
  }

  void addNewSong(Song song) {
    final newSongs = [...state.songs];
    newSongs.add(song);
    setNewSongs(newSongs);
  }

  void playOrPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void navigateTo(int songIndex, BuildContext context) {
    if (songIndex != previousSongIndex) {
      Navigator.of(context).pushNamed(
        SongRoutesGenerator.initialRoute,
        arguments: SongRouteArgument(
            song: state.songs[songIndex], isForward: isForward),
      );
      previousSongIndex = songIndex;
    }
  }

  void setDuration(Duration duration) {
    player.seek(duration);
  }
}
