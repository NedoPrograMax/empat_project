import 'package:empat_app/models/song.dart';
import 'package:uuid/uuid.dart';

class Playlist {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final List<Song> songs;
  final String id;

  Playlist({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.songs,
    required this.description,
  }) : id = const Uuid().v4();

  Playlist.withId({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.songs,
    required this.description,
    required this.id,
  });

  Playlist addSong(Song song) {
    final newSongs = [...songs];
    newSongs.add(song);
    return Playlist.withId(
      title: title,
      author: author,
      imageUrl: imageUrl,
      songs: newSongs,
      description: description,
      id: id,
    );
  }
}
