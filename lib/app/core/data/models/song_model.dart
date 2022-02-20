import 'artist_model.dart';

class Song {
  final String title;
  final String image;
  final List<Artist> artists;
  final bool active;

  Song(
      {required this.title,
      required this.image,
      required this.artists,
      this.active = false});
}
