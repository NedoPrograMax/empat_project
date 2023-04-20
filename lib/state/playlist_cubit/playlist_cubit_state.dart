import 'package:empat_app/models/song.dart';

class PlaylistCubitState {
  final List<Song> songs;
  final int currentSongIndex;
  final Stream<bool> isPlaying;
  final Stream<Duration> durationStream;
  final Stream<Duration?> songDuration;
  final Stream<int?>? currentSongStream;

  PlaylistCubitState copyWith({
    List<Song>? songs,
    int? currentSongIndex,
    Stream<bool>? isPlaying,
    Stream<Duration?>? songDuration,
    Stream<Duration>? durationStream,
    Stream<int?>? currentSongStream,
  }) =>
      PlaylistCubitState(
        songs: songs ?? this.songs,
        currentSongIndex: currentSongIndex ?? this.currentSongIndex,
        isPlaying: isPlaying ?? this.isPlaying,
        durationStream: durationStream ?? this.durationStream,
        songDuration: songDuration ?? this.songDuration,
        currentSongStream: currentSongStream ?? this.currentSongStream,
      );

  PlaylistCubitState({
    required this.songs,
    required this.currentSongIndex,
    required this.isPlaying,
    required this.durationStream,
    required this.songDuration,
    required this.currentSongStream,
  });
}
