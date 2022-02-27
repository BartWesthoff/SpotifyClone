import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/artist/screen/artist_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/search/widgets/explore_album_tile.dart';
import 'package:spotifyclone/app/core/ui/screens/search/widgets/title_widget.dart';

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
              child: TileTitle(title: "Jouw Topgenres"),
            ),
            SliverToBoxAdapter(
              child: ColumnBuilder(
                  itemBuilder: (context, index) => ExploreAlbumRow(),
                  itemCount: 2),
            ),
            SliverToBoxAdapter(
              child: TileTitle(title: "Alles doorzoeken"),
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
