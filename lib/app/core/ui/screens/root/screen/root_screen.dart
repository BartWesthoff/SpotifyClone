import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/home/screen/home_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/library/screen/library_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/root/bloc/nav_bar_cubit.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_screen.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: Colors.black.withOpacity(0.1),
            elevation: 0,
            currentIndex: state.index,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.search,
                ),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.my_library_music_outlined,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.search);
              } else if (index == 2) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.library);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavBarCubit, NavBarState>(builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return HomeScreen();
        } else if (state.navbarItem == NavbarItem.search) {
          return SearchScreen();
        } else if (state.navbarItem == NavbarItem.library) {
          return LibraryScreen();
        }
        return Container();
      }),
    );
  }
}
