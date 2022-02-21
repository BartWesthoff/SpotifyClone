import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/models/playlist_model.dart';
import 'package:spotifyclone/app/core/data/playlists.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    // final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFF121212),
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(-0.7, -0.7),
              colors: [
                const Color(0xffEBEEE3).withOpacity(0.3),
                Colors.black,
              ],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomePreferredPlayListSection(),
                    PlaylistSection(
                      title: 'Recenty Played',
                      playlists: recentlyPlayed,
                    ),
                    const SizedBox(height: 10 * 5),
                    PlaylistSection(
                      title: 'Jump back in',
                      playlists: jumpBackIn,
                    ),
                    const SizedBox(height: 10 * 17),
                  ],
                ),
              ),
              //   SpBottomNavigation(songIsPlaying: true),
            ],
          ),
        ));
  }
}

class HomePreferredPlayListSection extends StatelessWidget {
  const HomePreferredPlayListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10 * 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 * 2),
          child: Text(
            'Good evening',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).colorScheme.background),
          ),
        ),
        const SizedBox(height: 10 * 1.5),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10 * 1.5),
          child: Row(
            children: [
              homeUserPlaylist(playlist: userLeftPlaylistData),
              homeUserPlaylist(playlist: userRightPlaylistData),
            ],
          ),
        ),
        const SizedBox(height: 10 * 4.5),
      ],
    );
  }
}

Widget homeUserPlaylist({required List<Playlist> playlist}) {
  return Expanded(
    child: Column(
      children: playlist.map((item) => UserPlaylistItem(data: item)).toList(),
    ),
  );
}

class UserPlaylistItem extends StatelessWidget {
  final Playlist data;

  const UserPlaylistItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //push to new page
      },
      child: Container(
        margin: const EdgeInsets.all(10 * 0.5),
        height: 10 * 6,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2A2A2A),
            ),
            child: Row(
              children: [
                Image.asset(
                  data.image,
                  height: 10 * 6,
                  width: 10 * 6,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    data.title,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShuffleButton extends StatelessWidget {
  final Function() onTap;

  const ShuffleButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10 * 1.2,
        width: 10 * 1.6,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.all(2),
          child: Icon(Icons.shuffle),
        ),
      ),
    );
  }
}

class PlaylistSection extends StatelessWidget {
  final String title;
  final List<Playlist> playlists;

  const PlaylistSection({
    Key? key,
    required this.title,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 * 2),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).colorScheme.background),
          ),
        ),
        const SizedBox(height: 10 * 2),
        SizedBox(
          height: 10 * 18,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 10 * 2 : 10,
                  right: index == playlists.length - 1 ? 10 * 2 : 10,
                ),
                child: PlayListItem(data: playlists[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class PlayListItem extends StatelessWidget {
  final Playlist data;

  const PlayListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // push
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data.image,
            height: 10 * 15,
            width: 10 * 15,
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Theme.of(context).colorScheme.background),
          ),
        ],
      ),
    );
  }
}
