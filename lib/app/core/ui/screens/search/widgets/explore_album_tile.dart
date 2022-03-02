import 'package:flutter/material.dart';
import 'package:spotifyclone/app/routes/routes.dart';

class Tile extends StatefulWidget {
  final Color color;
  final String genre;
  const Tile({Key? key, required this.color, required this.genre})
      : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(_controller);
    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.5).animate(_controller);

    _controller.drive(
      CurveTween(
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onLongPress: () => _controller.forward(),
            onTapDown: (_) => _controller.forward(),
            onTap: () {
              Navigation.instance.pushNamed(route: Routes.genre);
              _controller.reverse();
            },
            onLongPressUp: () => _controller.reverse(),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2 - 16,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(4.0)),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      bottom: -10,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(30 / 360),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(4.0),
                          ),
                          child: Image.asset(
                            'assets/images/1.jpg',
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      curve: Curves.easeOutCirc,
                      opacity: _opacityAnimation.value,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.genre,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
