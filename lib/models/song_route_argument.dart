import 'package:empat_app/models/song.dart';

class SongRouteArgument {
  final Song song;
  final bool isForward;
  const SongRouteArgument({
    required this.song,
    required this.isForward,
  });

  SongRouteArgument.empty()
      : song = Song.empty(),
        isForward = true;
}
