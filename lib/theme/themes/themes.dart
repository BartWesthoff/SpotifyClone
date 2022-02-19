import 'dark_theme.dart';
import 'light_theme.dart';

enum AppTheme {
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.LightTheme: lightTheme,
  AppTheme.DarkTheme: darkTheme,
};
