import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';
import 'package:spotifyclone/app/core/ui/screens/artist/screen/artist_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/screen/playlist_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            bottom: PreferredSize(
              preferredSize: const Size(0.0, 16.0),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 40,
                        ),
                        Text(
                          "Artiesten, nummers of podcasts",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(
                      //       color: Colors.black,
                      //       width: 4,
                      //       style: BorderStyle.solid),
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 5,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                alignment: Alignment(-1.0, -0.4),
                child: Text(
                  "Zoeken",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ColumnBuilder(
                itemBuilder: (context, index) => ExploreAlbumRow(),
                itemCount: 50),
          )
        ],
      ),
    );
  }
}

class ExploreAlbumRow extends StatelessWidget {
  const ExploreAlbumRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExploreAlbumTile(color: Colors.red, genre: "NL"),
        ExploreAlbumTile(color: Colors.purple, genre: "Pop"),
      ],
    );
  }
}

class ExploreAlbumTile extends StatelessWidget {
  final Color color;
  final String genre;
  const ExploreAlbumTile({Key? key, required this.color, required this.genre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  genre,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Positioned(
                right: -20,
                bottom: -10,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(30 / 360),
                  child: Image.asset(
                    'assets/images/1.jpg',
                    height: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
