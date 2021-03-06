import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/authentication/bloc/authentication_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/genre/screen/genre_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/home/screen/home_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/intro/screen/intro_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/login/screen/login_page.dart';
import 'package:spotifyclone/app/core/ui/screens/root/screen/root_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/seemoregenre/screen/seemoregenre_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/sign_up/screen/sign_up_page.dart';

class Routes {
  static const String intial = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String home = '/home';
  static const String library = '/library';
  static const String search = '/search';
  static const String root = '/root';
  static const String genre = '/genre';
  static const String seemore = '/seemore';
}

class Navigation {
  late GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static Navigation instance = Navigation();

  Future<dynamic> popToFirst({required String route, Object? arguments}) =>
      navigationKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (Route<dynamic> route) => route.isFirst,
        arguments: arguments,
      );

  void reset({required String route, Object? arguments}) =>
      navigationKey.currentState!.popUntil(ModalRoute.withName(route));

  Future<dynamic> pushReplace({required String route, Object? arguments}) =>
      navigationKey.currentState!.pushReplacementNamed(route);

  Future<dynamic> pushNamed({required String route, Object? arguments}) =>
      navigationKey.currentState!.pushNamed(route, arguments: arguments);

  void goback() => navigationKey.currentState!.pop();
}

Route<dynamic>? onGenerateRoute(
  RouteSettings settings,
  BuildContext context,
) {
  //final args = settings.arguments;
  if (BlocProvider.of<AuthenticationBloc>(context).state.status ==
      AuthenticationStatus.authenticated) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute<dynamic>(
          builder: (_) => RootScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.home:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HomeScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.library:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const HomeScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.search:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SearchScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.genre:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const GenreScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.seemore:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SeeMoreScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RootScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
  if (BlocProvider.of<AuthenticationBloc>(context).state.status ==
      AuthenticationStatus.unauthenticated) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SignUpPage(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
  return MaterialPageRoute<dynamic>(
    builder: (_) => const IntroScreen(),
    settings: settings,
    fullscreenDialog: true,
  );
}

class ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRotateRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(seconds: 0),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
          ),
        );
}
