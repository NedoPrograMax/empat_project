import 'package:empat_app/models/song.dart';

class PlaylistCubitState {
  final List<Song> songs;
  final int currentSongIndex;
  final Stream<bool> isPlaying;
  final Stream<Duration> durationStream;
  final Stream<Duration?> songDuration;
  final int? whereToNavigate;

  PlaylistCubitState copyWith({
    List<Song>? songs,
    int? currentSongIndex,
    Stream<bool>? isPlaying,
    Stream<Duration?>? songDuration,
    Stream<Duration>? durationStream,
    int? whereToNavigate,
  }) =>
      PlaylistCubitState(
        songs: songs ?? this.songs,
        currentSongIndex: currentSongIndex ?? this.currentSongIndex,
        isPlaying: isPlaying ?? this.isPlaying,
        durationStream: durationStream ?? this.durationStream,
        songDuration: songDuration ?? this.songDuration,
        whereToNavigate: whereToNavigate,
      );
  PlaylistCubitState({
    required this.songs,
    required this.currentSongIndex,
    required this.isPlaying,
    required this.durationStream,
    required this.songDuration,
    this.whereToNavigate,
  });
}
