import 'package:spotifyclone/app/theme/themes/dark_theme.dart';
import 'package:spotifyclone/app/theme/themes/light_theme.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

final appThemeData = {
  AppTheme.lightTheme: lightTheme,
  AppTheme.darkTheme: darkTheme,
};
