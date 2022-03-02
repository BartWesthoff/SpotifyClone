import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/screens/search/widgets/album_row_widget.dart';
import 'package:spotifyclone/app/core/ui/screens/search/widgets/title_widget.dart';
import 'package:spotifyclone/app/widgets/column_builder.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 56,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: const [
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
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                alignment: const Alignment(-0.95, -0.4),
                child: const Text(
                  "Zoeken",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: TileTitle(title: "Jouw Topgenres"),
          ),
          SliverToBoxAdapter(
            child: ColumnBuilder(
              itemBuilder: (context, index) => const ExploreAlbumRow(),
              itemCount: 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: TileTitle(title: "Alles doorzoeken"),
          ),
          SliverToBoxAdapter(
            child: ColumnBuilder(
              itemBuilder: (context, index) => const ExploreAlbumRow(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
