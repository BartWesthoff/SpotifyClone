import 'package:spotifyclone/app/core/data/models/artist_model.dart';

class Song {
  final String title;
  final String image;
  final List<Artist> artists;
  final bool active;
  final bool lyrics;
  final bool Explicit;

  Song({
    required this.title,
    required this.image,
    required this.artists,
    this.active = false,
    this.lyrics = false,
    this.Explicit = false,
  });
}
