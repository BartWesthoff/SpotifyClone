import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/home/screen/home_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/playlist/screen/playlist_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/root/bloc/nav_bar_cubit.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_screen.dart';
import 'package:spotifyclone/app/widgets/bottom_nav_bar_widget.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomeScreen();
          } else if (state.navbarItem == NavbarItem.search) {
            return const SearchScreen();
          } else if (state.navbarItem == NavbarItem.library) {
            return const ArtistPlaylistScreen();
          }
          return Container();
        },
      ),
    );
  }
}
