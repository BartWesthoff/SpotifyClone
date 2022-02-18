import 'package:authentication_repository/authentication_repository.dart';
import 'package:spotifyclone/app/core/authentication/bloc/auth_bloc.dart';
import 'package:spotifyclone/app/core/authentication/bloc/auth_state.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_bloc.dart';
import 'package:spotifyclone/app/core/ui/theme/bloc/theme_state.dart';
import 'package:spotifyclone/app/core/ui/theme/themes/owntheme.dart';
import 'package:spotifyclone/app/routes/routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
            create: (_) => AuthBloc(
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
        theme: state.themeData,
        debugShowCheckedModeBanner: false,
        home: FlowBuilder<AuthStatus>(
          state: context.select((AuthBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      );
    });
  }
}
