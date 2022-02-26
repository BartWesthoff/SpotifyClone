import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclone/app/app.dart';
import 'package:spotifyclone/app/bloc_observer.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();

  await authenticationRepository.user.first;
  BlocOverrides.runZoned(
    () => runApp(ProviderScope(
        child: App(authenticationRepository: authenticationRepository))),
    blocObserver: AuthBlocObserver(),
  );
}
