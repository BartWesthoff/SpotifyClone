import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';
import 'package:spotifyclone/app/core/ui/screens/genre/screen/genre_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/screen/playlist_screen.dart';
import 'package:spotifyclone/app/routes/routes.dart';
import 'package:spotifyclone/app/widgets/bottom_nav_bar_widget.dart';
import 'package:spotifyclone/app/widgets/column_builder.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Populaire playlist",
          style: TextStyle(
            fontFamily: 'GothamMedium',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xff282828),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
              child: Center(
                child: Text(
                  "Populaire playlist",
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontFamily: 'GothamMedium',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            ColumnBuilder(
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GenreAlbum(
                      playlist: userLeftPlaylistData[0],
                    ),
                    const SizedBox(width: 16),
                    GenreAlbum(
                      playlist: userLeftPlaylistData[1],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
