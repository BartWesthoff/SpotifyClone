import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:spotifyclone/app/core/authentication/bloc/authentication_bloc.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_state.dart';
import 'package:spotifyclone/app/routes/routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider<ThemeBloc>(create: (BuildContext context) => ThemeBloc())
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      FlutterNativeSplash.remove();
      return MaterialApp(
        navigatorKey: Navigation.instance.navigationKey,
        theme: state.theme,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  Navigation.instance.pushReplace(route: Routes.home);
                  break;
                case AuthenticationStatus.unauthenticated:
                  Navigation.instance.pushReplace(route: Routes.intro);
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: (settings) =>
            AppRouter.onGenerateRoute(settings, context),
      );
    });
  }
}
//TODO fix bug not correctly getting info on first login
// Only happens on the first login
