import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final double size;

  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PlaylistScreen1(
        //       playlist: userLeftPlaylistData[0],
        //       image: image,
        //     ),
        //   ),
        // );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
