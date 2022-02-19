import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/authentication/bloc/auth_state.dart';
import 'package:spotifyclone/app/core/ui/screens/home/screen/home_page.dart';
import 'package:spotifyclone/app/core/ui/screens/intro/screen/intro_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/login/screen/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:spotifyclone/app/core/ui/screens/sign_up/screen/sign_up_page.dart';

List<Page> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomePage.page()];
    case AuthStatus.unauthenticated:
    default:
      return [IntroScreen.page()];
  }
}

class Routes {
  static const String intial = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signUp = '/signup';
}

class Navigation {
  late GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static Navigation instance = Navigation();

  Future<dynamic> pushReplace({required String route, Object? arguments}) =>
      navigationKey.currentState!.pushNamedAndRemoveUntil(
          route, (Route<dynamic> route) => route.isFirst,
          arguments: arguments);

  Future<dynamic> pushNamed({required String route, Object? arguments}) =>
      navigationKey.currentState!.pushNamed(route, arguments: arguments);

  void goback() => navigationKey.currentState!.pop();
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.intro:
        // final event = args as CalendarEvent;
        return MaterialPageRoute<dynamic>(
          builder: (_) => IntroScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.login:
        // final event = args as CalendarEvent;
        return MaterialPageRoute<dynamic>(
          builder: (_) => LoginPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.signUp:
        // final event = args as CalendarEvent;
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignUpPage(),
          settings: settings,
          fullscreenDialog: true,
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => IntroScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}
