import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/widgets/album_row_widget.dart';

class ExtraSection extends StatelessWidget {
  final double cardSize;

  const ExtraSection({Key? key, required this.cardSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You might also like",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
        ],
      ),
    );
  }
}
