import 'package:empat_app/core/constants.dart';
import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/models/song.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:palette_generator/palette_generator.dart';

extension ImageExtension on ImageProvider {
  Future<Color> getDominantColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(this);
    return paletteGenerator.darkMutedColor?.color ?? surfaceColor;
  }
}

extension SongsExtension on List<Song> {
  Future<void> setColors() {
    final futureList = map(
      (song) async => song.mainColor =
          song.mainColor ?? await song.image.getDominantColor(),
    );
    return Future.wait(futureList);
  }

  List<Song> search(String text) => where(
        (song) =>
            song.title.toLowerCase().contains(text.toLowerCase()) ||
            song.band.toLowerCase().contains(text.toLowerCase()),
      ).toList();

  List<AudioSource> toAudioSources() => map(
        (song) => AudioSource.asset(
          song.musicAsset,
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: song.id,
            // Metadata to display in the notification:
            album: song.band,
            title: song.title,
            artUri: Uri.parse(song.imageUrl),
          ),
        ),
      ).toList();
}

extension DurationExtension on Duration {
  String get textTime {
    final minutes = inMinutes;
    final seconds = inSeconds.remainder(60);
    final minutesText = minutes < 10 ? "0$minutes" : "$minutes";
    final secondsText = seconds < 10 ? "0$seconds" : "$seconds";
    return "$minutesText:$secondsText";
  }
}
