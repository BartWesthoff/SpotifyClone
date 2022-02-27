import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/screen/playlist_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/widgets/song_row_widget.dart';
import 'package:spotifyclone/app/widgets/column_builder.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  'assets/images/artist_avatar_phone_2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.black.withOpacity(0.2),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.green.withOpacity(0.2),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3 - 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lil nas X",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 56,
                          fontFamily: 'GothamMedium',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.darken(0.2),
                            Colors.black,
                          ],
                          stops: const [0.0, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "1.398.939 maandelijkse luisteraars",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'GothamMedium',
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: const [
                              FollowButton(),
                              SizedBox(width: 24.0),
                              Icon(Icons.more_vert, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Populair",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ColumnBuilder(
                        itemBuilder: (context, index) => SongRow(
                          number: index + 1,
                          numbered: true,
                          song: defaultSong,
                        ),
                        itemCount: 5,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Populaire releases",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          ColumnBuilder(
                            itemBuilder: (context, index) => const ReleaseRow(),
                            itemCount: 4,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: const Text(
        "Volgen",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ReleaseRow extends StatelessWidget {
  const ReleaseRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Image.asset(
              'assets/images/artist_avatar_phone.jpg',
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Je Blik Richting Mij",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Nieuwste release * Single",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
