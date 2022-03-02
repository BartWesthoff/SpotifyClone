import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/models/playlist_model.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';
import 'package:spotifyclone/app/routes/routes.dart';
import 'package:spotifyclone/app/widgets/bottom_nav_bar_widget.dart';
import 'package:spotifyclone/app/widgets/column_builder.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  late final ScrollController controller;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = MediaQuery.of(context).padding.top;
    controller.addListener(() {
      if (controller.offset > MediaQuery.of(context).size.height * 0.20 &&
          !isVisible) {
        setState(() {
          isVisible = true;
        });
      }
      if (isVisible &&
          controller.offset < MediaQuery.of(context).size.height * 0.20) {
        setState(() {
          isVisible = false;
        });
      }
    });
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1],
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 56.0),
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "NL",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Playlist",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ColumnBuilder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GenreAlbum(
                          playlist: userLeftPlaylistData[index + 1],
                        ),
                        const SizedBox(width: 16),
                        GenreAlbum(
                          playlist: userLeftPlaylistData[index],
                        ),
                      ],
                    ),
                  ),
                ),
                const SeeMoreButton(),
                Text(
                  "Nieuwe releases",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ColumnBuilder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GenreAlbum(
                          playlist: userLeftPlaylistData[index],
                        ),
                        const SizedBox(width: 16),
                        GenreAlbum(
                          playlist: userLeftPlaylistData[index + 1],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isVisible)
            Container(
              height: 56 + toolbarHeight,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff883128), Colors.black],
                  stops: [0.2, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: toolbarHeight + 8.0,
                  bottom: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 62.0,
                    ),
                    Text(
                      "NL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              top: toolbarHeight + 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenreAlbum extends StatelessWidget {
  final Playlist playlist;

  const GenreAlbum({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Image.asset(
            playlist.image,
            width: MediaQuery.of(context).size.width / 2 - 16,
          ),
          Text(
            playlist.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            "${playlist.formattedfollowers} VOLGERS",
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 12,
              fontFamily: 'GothamMedium',
            ),
          ),
        ],
      ),
    );
  }
}

class SeeMoreButton extends StatefulWidget {
  const SeeMoreButton({Key? key}) : super(key: key);

  @override
  _SeeMoreButtonState createState() => _SeeMoreButtonState();
}

class _SeeMoreButtonState extends State<SeeMoreButton>
    with SingleTickerProviderStateMixin {
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
              Navigation.instance.pushNamed(route: Routes.seemore);
              _controller.reverse();
            },
            onLongPressUp: () => _controller.reverse(),
            child: Container(
              margin: const EdgeInsets.all(24.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade900),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(4.0)),
                child: AnimatedOpacity(
                  curve: Curves.easeOutCirc,
                  opacity: _opacityAnimation.value,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Meer bekijken",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        fontFamily: 'GothamMedium',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
