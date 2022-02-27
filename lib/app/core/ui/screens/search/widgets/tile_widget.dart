import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_state.dart';

class Tile extends StatelessWidget {
  final Color color;
  final TileState state;
  final String genre;
  bool scrolling;

  Tile(
      {Key? key,
      required this.color,
      required this.state,
      required this.genre,
      required this.scrolling})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scale2 = state.scale;
    if (scrolling) scale2 = 1.0;
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.identity()..scale(scale2),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutExpo,
      // margin: EdgeInsets.all(count.padding),
      // Provide an optional curve to make the animation feel smoother.
      height: 100,
      width: MediaQuery.of(context).size.width / 2 - 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -10,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(30 / 360),
                child: Image.asset(
                  'assets/images/1.jpg',
                  height: 80,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                curve: Curves.easeOutExpo,
                opacity: scrolling ? 1 : state.opacity,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  genre,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
