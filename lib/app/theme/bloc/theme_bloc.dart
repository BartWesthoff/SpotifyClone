import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/theme/bloc/theme_event.dart';
import 'package:spotifyclone/app/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeNumber: 0)) {
    on<ThemeChanged>(
      (event, emit) => emit(ThemeState(themeNumber: event.themeNumber)),
    );
  }
// Keep this for migration BLoC version 7.3.0 -> 8.0.2
// @override
// Stream<ThemeState> mapEventToState(
//   ThemeEvent event,
// ) async* {
//   if (event is ThemeChanged) {
//     yield ThemeState(themeData: appThemeData[event.theme]);
//   }
// }

}
