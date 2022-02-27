import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/widgets/album_card_widget.dart';

class AlbumRow extends StatelessWidget {
  final double cardSize;

  const AlbumRow({Key? key, required this.cardSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AlbumCard(
            size: cardSize,
            label: "Get Turnt",
            image: const AssetImage("assets/images/6.jpg"),
          ),
          AlbumCard(
            size: cardSize,
            label: "Get Turnt",
            image: const AssetImage("assets/images/9.jpg"),
          ),
        ],
      ),
    );
  }
}
