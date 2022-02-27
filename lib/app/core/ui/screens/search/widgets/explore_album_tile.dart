import 'package:flutter/material.dart';

class ExploreAlbumTile extends StatefulWidget {
  final Color color;
  final String genre;

  const ExploreAlbumTile({Key? key, required this.color, required this.genre})
      : super(key: key);

  @override
  _ExploreAlbumTileState createState() => _ExploreAlbumTileState();
}

class _ExploreAlbumTileState extends State<ExploreAlbumTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(_controller);
    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.5).animate(_controller);

    _scaleAnimation.addStatusListener((status) {
      // if (_controller.isCompleted)
      //   Future.delayed(
      //     const Duration(milliseconds: 500),
      //     () => _controller.reverse(),
      //   );
    });
    _controller.drive(
      CurveTween(
        curve: Curves.easeOutExpo,
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
            onTap: () => print("on tap"),
            onLongPressUp: () => _controller.reverse(),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2 - 16,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      bottom: -10,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(30 / 360),
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
                        opacity: _opacityAnimation.value,
                        duration: const Duration(milliseconds: 500),
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
