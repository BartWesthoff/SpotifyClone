import 'package:spotifyclone/app/core/data/models/song_model.dart';

class Playlist {
  final String title;
  final String image;
  final bool shuffle;
  final String likes;
  final List<Song> songs;

  Playlist(
      {required this.title,
      required this.image,
      required this.shuffle,
      required this.likes,
      required this.songs});
}
