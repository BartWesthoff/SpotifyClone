import 'package:spotifyclone/app/core/authentication/bloc/auth_state.dart';
import 'package:spotifyclone/app/core/ui/screens/home/screen/home_page.dart';
import 'package:spotifyclone/app/core/ui/screens/login/screen/login_page.dart';
import 'package:flutter/widgets.dart';

List<Page> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomePage.page()];
    case AuthStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
