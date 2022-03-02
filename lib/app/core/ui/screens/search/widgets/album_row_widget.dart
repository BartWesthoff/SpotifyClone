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
          Tile(
            color: Colors.red,
            genre: "NL",
          ),
          SizedBox(
            width: 16.0,
          ),
          Tile(
            color: Colors.red,
            genre: "NL",
          ),
        ],
      ),
    );
  }
}

// Tile(
// widget: widget,
// opacityAnimation: _opacityAnimation,
// color: widget.color,
// genre: widget.genre)
