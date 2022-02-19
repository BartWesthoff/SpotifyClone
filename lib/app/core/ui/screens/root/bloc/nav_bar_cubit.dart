import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_state.dart';

enum NavbarItem { home, search, library }

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavBarState(NavbarItem.home, 0));
        break;
      case NavbarItem.search:
        emit(NavBarState(NavbarItem.search, 1));
        break;
      case NavbarItem.library:
        emit(NavBarState(NavbarItem.library, 2));
        break;
    }
  }
}
