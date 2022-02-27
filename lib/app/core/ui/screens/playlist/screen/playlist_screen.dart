import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/widgets/song_row_widget.dart';
import 'package:spotifyclone/app/widgets/column_builder.dart';

final counterProvider2 = StateProvider((ref) => 0.0);

class ArtistPlaylistScreen extends ConsumerStatefulWidget {
  const ArtistPlaylistScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ArtistPlaylistScreen> createState() => _SpotifyAlbumViewState();
}

class _SpotifyAlbumViewState extends ConsumerState<ArtistPlaylistScreen> {
  late ScrollController _scrollController;

  late double maxAppBarHeight;
  late double minAppBarHeight;
  late double infoBoxHeight;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    maxAppBarHeight = MediaQuery.of(context).size.height * 0.5;
    minAppBarHeight = 56;
    infoBoxHeight = 180;
    _scrollController.addListener(() {
      if (_scrollController.offset % 2 != 0) {
        ref.read(counterProvider2.state).state = _scrollController.offset;
      }
    });
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kPrimaryColor,
                Colors.black,
              ],
              stops: [0, 0.7],
            ),
          ),
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  const SearchBar(),
                  SliverCustomeAppBar(
                    maxAppBarHeight: maxAppBarHeight,
                    minAppBarHeight: minAppBarHeight,
                  ),
                  AlbumInfo(infoBoxHeight: infoBoxHeight),
                  // const AlbumSongsList(),
                  SliverToBoxAdapter(
                    child: ColumnBuilder(
                      itemBuilder: (context, index) => SongRow(
                        number: index + 1,
                        numbered: false,
                        song: defaultSong,
                      ),
                      itemCount: 10,
                    ),
                  )
                ],
              ),
              Consumer(
                builder: (context, ref, _) {
                  final count = ref.watch(counterProvider2.state).state;
                  final bool appBarVisible =
                      count > MediaQuery.of(context).size.height * 0.45;
                  final double percent = (_scrollController.position.pixels /
                          MediaQuery.of(context).size.height) *
                      100;

                  return AppBars(
                    showAppBar: appBarVisible,
                    titleOpacity: appBarVisible ? percent / 90 + 0.1 : 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          top: 56.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      "Zoeken in playlist",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Sorteren",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AlbumSongsList extends StatelessWidget {
  const AlbumSongsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => SongRow(
          number: index,
          numbered: false,
          song: defaultSong,
        ),
      ),
    );
  }
}

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({
    Key? key,
    required this.infoBoxHeight,
  }) : super(key: key);

  final double infoBoxHeight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black87,
            ],
            stops: [
              0.00022,
              1.0,
            ],
          ),
        ),
        child: SizedBox(
          height: infoBoxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "=",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(edImageUrl),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Ed Sheeran",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Album . 2021",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      child: Icon(
                        Icons.download_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 4,
                      ),
                      child: Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBars extends StatelessWidget {
  final bool showAppBar;
  final double titleOpacity;

  const AppBars({
    Key? key,
    required this.showAppBar,
    required this.titleOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        gradient: showAppBar
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kAppBarPrimary,
                  kAppBarSecondary,
                ],
                stops: [0, 0.5],
              )
            : null,
      ),
      child: FixedAppBar(titleOpacity: titleOpacity),
    );
  }
}

class FixedAppBar extends StatelessWidget {
  const FixedAppBar({
    Key? key,
    required this.titleOpacity,
  }) : super(key: key);

  final double titleOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 56,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          const SizedBox(width: 8.0),
          const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          const SizedBox(width: 30),
          AnimatedOpacity(
            opacity: titleOpacity.clamp(0, 1),
            duration: const Duration(milliseconds: 100),
            child: const Text(
              "Kevin",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverCustomeAppBar extends StatelessWidget {
  const SliverCustomeAppBar({
    Key? key,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
  }) : super(key: key);

  final double maxAppBarHeight;
  final double minAppBarHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        maxHeight: maxAppBarHeight,
        minHeight: minAppBarHeight,
        builder: (context, shrinkOffset) {
          final appBarVisible =
              shrinkOffset >= (maxAppBarHeight - minAppBarHeight);
          print(appBarVisible);
          final double shrinkToMaxAppBarHeightRatio =
              shrinkOffset / maxAppBarHeight - 0.3;
          const double animatAlbumImageFromPoint = 0.3;
          final animateAlbumImage =
              shrinkToMaxAppBarHeightRatio >= animatAlbumImageFromPoint;
          final animateOpacityToZero = shrinkToMaxAppBarHeightRatio > 0.4;
          final albumImageSize =
              MediaQuery.of(context).size.height * 0.35 - shrinkOffset / 2;

          return Stack(
            alignment: Alignment.topCenter,
            children: [
              AlbumImage(
                animateOpacityToZero: animateOpacityToZero,
                animateAlbumImage: animateAlbumImage,
                shrinkToMaxAppBarHeightRatio: shrinkToMaxAppBarHeightRatio,
                albumImageSize: albumImageSize,
              ),
            ],
          );
        },
      ),
    );
  }
}

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    Key? key,
    required this.animateOpacityToZero,
    required this.animateAlbumImage,
    required this.shrinkToMaxAppBarHeightRatio,
    required this.albumImageSize,
  }) : super(key: key);

  final bool animateOpacityToZero;
  final bool animateAlbumImage;
  final double shrinkToMaxAppBarHeightRatio;
  final double albumImageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: animateOpacityToZero
            ? 0
            : animateAlbumImage
                ? 1 - shrinkToMaxAppBarHeightRatio
                : 1,
        child: Container(
          height: albumImageSize > 0 ? albumImageSize : 0,
          width: albumImageSize > 0 ? albumImageSize : 0,
          decoration: const BoxDecoration(
            color: Colors.deepPurpleAccent,
            // image: DecorationImage(
            //   image: NetworkImage(albumImageUrl),
            //   fit: BoxFit.cover,
            // ),
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                spreadRadius: 1,
                blurRadius: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.builder,
  });

  final double minHeight;
  final double maxHeight;
  final Widget Function(BuildContext, double) builder;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: builder(context, shrinkOffset),
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        builder != oldDelegate.builder;
  }
}

extension ColorsExtension on Color {
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

const Color kPrimaryColor = Color(0xFF9B6AF2);
const Color kPlayPauseButtonColor = Color(0xFF78FF45);
const Color kAppBarPrimary = Color(0xFF816EC1);
const Color kAppBarSecondary = Color(0xFF5E4E95);

String albumImageUrl =
    "https://upload.wikimedia.org/wikipedia/en/c/cd/Ed_Sheeran_-_Equals.png";

String edImageUrl =
    "https://i.scdn.co/image/ab6761610000e5eb12a2ef08d00dd7451a6dbed6";
