import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/screen/playlist_screen.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({Key? key}) : super(key: key);
  final double initialSize = 400.0;
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
                  )),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Lil nas X",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 56,
                          fontFamily: 'GothamMedium',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.green.darken(0.2),
                        Colors.black,
                      ],
                      stops: [0.0, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1.398.939 maandelijkse luisteraars",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'GothamMedium',
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Populair",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    ColumnBuilder(
                        itemBuilder: (context, index) => SongRow(
                            number: index + 1,
                            numbered: true,
                            song: defaultSong),
                        itemCount: 5),
                    SizedBox(
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Populaire releases",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        ColumnBuilder(
                            itemBuilder: (context, index) => ReleaseRow(),
                            itemCount: 4)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ))
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
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
              color: Colors.grey, width: 1, style: BorderStyle.solid)),
      child: Text(
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
      child: Container(
        height: 100,
        child: Row(
          children: [
            Image.asset(
              'assets/images/artist_avatar_phone.jpg',
            ),
            SizedBox(
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
                SizedBox(
                  height: 4,
                ),
                Text(
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

class ColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  const ColumnBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(itemCount, (index) => itemBuilder(context, index))
          .toList(),
    );
  }
}
