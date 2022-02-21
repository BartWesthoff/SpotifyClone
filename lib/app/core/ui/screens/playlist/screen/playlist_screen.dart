import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/models/playlist_model.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';

class PlaylistScreen extends StatefulWidget {
  final ImageProvider image;
  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.image, required this.playlist})
      : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        print(scrollController.offset);
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Stack(children: [
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 0.9),
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        const Color(0xFF121212),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: initialSize + 155.0, left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "for i in songs.artist print artist if artist.lenght >3 print 'and more'",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.grey.withOpacity(0.7)),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "5 uur 3 min.",
                          style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                          // style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(height: 16),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite_outline,
                                    color: Colors.white),
                                SizedBox(width: 12),
                                Icon(
                                  Icons.download,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 16),
                                Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ExtraSection(cardSize: cardSize),
              ],
            ),
          ),
          // App bar
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [PlayButton(containerHeight: containerHeight)],
            ),
          ),
        ]),
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final double size;

  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistScreen(
              playlist: userLeftPlaylistData[0],
              image: image,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}

extension colors on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

class SongRow extends StatelessWidget {
  const SongRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Image.asset('assets/images/album_cover_1.jpg'),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Samen",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      height: 15,
                      child: Center(
                          child: Text(
                        "LYRICS",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'GothamMedium',
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      width: 15,
                      height: 15,
                      child: Center(
                          child: Text(
                        "E",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'GothamMedium',
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                  Text("Kevin, Yade Lauren",
                      style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          Spacer(),
          Icon(Icons.more_vert_sharp, color: Colors.grey),
        ],
      ),
    );
  }
}

class AlbumRow extends StatelessWidget {
  final double cardSize;
  const AlbumRow({Key? key, required this.cardSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AlbumCard(
            size: cardSize,
            label: "Get Turnt",
            image: AssetImage("assets/images/6.jpg"),
          ),
          AlbumCard(
            size: cardSize,
            label: "Get Turnt",
            image: AssetImage("assets/images/9.jpg"),
          ),
        ],
      ),
    );
  }
}

class ExtraSection extends StatelessWidget {
  final double cardSize;
  const ExtraSection({Key? key, required this.cardSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You might also like",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
          AlbumRow(cardSize: cardSize),
        ],
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  final double containerHeight;
  const PlayButton({Key? key, required this.containerHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 90 - containerHeight.clamp(120.0, double.infinity),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff14D860),
            ),
            child: Icon(
              Icons.play_arrow,
              size: 19,
            ),
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.shuffle,
              color: Colors.black,
              size: 7,
            ),
          )
        ],
      ),
    );
  }
}

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      // padding: EdgeInsets.only(left: 8.0),
      width: MediaQuery.of(context).size.width,
      color: Colors.red.darken(0.25),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            width: 16.0,
          ),
          Text("Kevin",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
