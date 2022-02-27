import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/artist/screen/artist_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_event.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_state.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_screen.dart';

class SearchView extends StatelessWidget {
  bool scrollState;
  SearchView({Key? key, required this.scrollState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return NotificationListener(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          controller: controller,
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              bottom: PreferredSize(
                preferredSize: const Size(0.0, 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 56,
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 40,
                            ),
                            SizedBox(width: 8),
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
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.white,
                        ),
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
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Container(
                  alignment: Alignment(-0.95, -0.4),
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
              child: Title(title: "Jouw Topgenres"),
            ),
            SliverToBoxAdapter(
              child: ColumnBuilder(
                  itemBuilder: (context, index) => ExploreAlbumRow(),
                  itemCount: 2),
            ),
            SliverToBoxAdapter(
              child: Title(title: "Alles doorzoeken"),
            ),
            SliverToBoxAdapter(
              child: ColumnBuilder(
                  itemBuilder: (context, index) => ExploreAlbumRow(),
                  itemCount: 50),
            ),
          ],
        ),
      ),
      onNotification: (notificationInfo) {
        if (notificationInfo is ScrollStartNotification) {
          print("scroll start");
          print("detail:" + notificationInfo.dragDetails.toString());
          context.read<ScrollBloc>().add(ScrollStarted());
          print(context.read<ScrollBloc>().state);

          /// your code
        }
        if (notificationInfo is ScrollEndNotification) {
          print("scroll stopped");
          print("detail:" + notificationInfo.dragDetails.toString());
          // context.read<ScrollBloc>().add(ScrollEnded());
          print(context.read<ScrollBloc>().state);
        }
        // if (notificationInfo is ScrollUpdateNotification) {
        //   print("scroll stopped");
        //   print("detail:" + notificationInfo.dragDetails.toString());
        //   context.read<ScrollBloc>().add(ScrollEnded());
        //   print(context.read<ScrollBloc>().state);
        // }
        return true;
      },
    );
  }
}

class ExploreAlbumRow extends StatelessWidget {
  const ExploreAlbumRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
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

class ExploreAlbumTile extends StatelessWidget {
  final Color color;
  final String genre;

  ExploreAlbumTile({
    Key? key,
    required this.color,
    required this.genre,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TileBloc(),
      child: BlocBuilder<TileBloc, TileState>(
        builder: (context, count) {
          return context.read<ScrollBloc>().state
              ? GestureDetector(
                  onVerticalDragDown: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onVerticalDragStart: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onVerticalDragUpdate: (details) {
                    context.read<TileBloc>().add(TilePressed());
                    print("drag update");
                  },
                  onHorizontalDragEnd: (details) =>
                      {context.read<TileBloc>().add(TileReleased())},
                  onLongPressUp: () {
                    context.read<TileBloc>().add(TileReleased());
                    print("long press up");
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onHorizontalDragStart: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onTapUp: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onTapDown: (details) {
                    context.read<TileBloc>().add(TilePressed());
                    print("ontapdown");
                    // context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  child: Tile(
                      color: color,
                      genre: genre,
                      state: count,
                      scrolling: context.read<ScrollBloc>().state),
                )
              :
              // Container(
              //         color: Colors.grey,
              //         height: 100,
              //         width: MediaQuery.of(context).size.width / 2 - 16,
              GestureDetector(
                  // onVerticalDragDown: (details) =>
                  // {context.read<TileBloc>().add(TileReleased())},
                  onHorizontalDragEnd: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },

                  // onVerticalDragUpdate: (details) {
                  //   context.read<TileBloc>().add(TilePressed());
                  //   print("drag update");
                  // },
                  onLongPressUp: () {
                    context.read<TileBloc>().add(TileReleased());
                    print("long press up2");
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onHorizontalDragStart: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onTapUp: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onTapDown: (details) {
                    context.read<TileBloc>().add(TilePressed());
                    print("ontapdown2");
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },

                  child: Tile(
                      color: color,
                      genre: genre,
                      state: count,
                      scrolling: context.read<ScrollBloc>().state),
                );
        },
      ),
    );
    //   },
    // ));
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 18),
      ),
    );
  }
}

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
