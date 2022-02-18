import 'package:spotifyclone/app/core/ui/theme/themes/themes.dart';
import 'package:bloc/bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: appThemeData[AppTheme.DarkTheme]!)) {
    on<ThemeChanged>((event, emit) =>
        emit(ThemeState(themeData: appThemeData[event.theme]!)));
  }

  // @override
  // Stream<ThemeState> mapEventToState(
  //   ThemeEvent event,
  // ) async* {
  //   if (event is ThemeChanged) {
  //     yield ThemeState(themeData: appThemeData[event.theme]);
  //   }
  // }

}
