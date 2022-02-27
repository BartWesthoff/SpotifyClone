import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/screens/search/widgets/explore_album_tile.dart';

class ExploreAlbumRow extends StatelessWidget {
  const ExploreAlbumRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: const [
          ExploreAlbumTile(
            color: Colors.red,
            genre: "NL",
          ),
          SizedBox(
            width: 16.0,
          ),
          ExploreAlbumTile(
            color: Colors.purple,
            genre: "Pop",
          ),
        ],
      ),
    );
  }
}
