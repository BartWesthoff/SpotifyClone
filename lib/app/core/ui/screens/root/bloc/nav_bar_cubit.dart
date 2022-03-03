import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotifyclone/app/routes/routes.dart';

part 'nav_bar_state.dart';

enum NavbarItem { home, search, library }

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavBarState(NavbarItem.home, 0));
        Navigation.instance.reset(route: Routes.intial);
        break;
      case NavbarItem.search:
        emit(const NavBarState(NavbarItem.search, 1));
        break;
      case NavbarItem.library:
        emit(const NavBarState(NavbarItem.library, 2));
        break;
    }
  }
}
