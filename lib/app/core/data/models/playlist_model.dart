import 'package:intl/intl.dart';
import 'package:spotifyclone/app/core/data/models/song_model.dart';

class Playlist {
  final String title;
  final String image;
  final bool shuffle;
  final String likes;
  final int followers;
  final List<Song> songs;

  Playlist({
    required this.title,
    required this.image,
    required this.followers,
    required this.shuffle,
    required this.likes,
    required this.songs,
  });

  String get formattedfollowers =>
      NumberFormat('#,##,000').format(followers).replaceFirst(',', '.');
}
