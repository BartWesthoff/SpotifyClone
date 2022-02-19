import 'package:flutter/material.dart';
import 'package:spotifyclone/theme/themes/themes.dart';

class ThemeState {
  final int themeNumber;
  late ThemeData theme;
  ThemeState({required this.themeNumber}) {
    if (themeNumber == 0) {
      theme = appThemeData[AppTheme.LightTheme]!;
    }
    if (themeNumber == 1) {
      theme = appThemeData[AppTheme.DarkTheme]!;
    }
  }

  ThemeState copyWith({required int themeNumber}) {
    return ThemeState(themeNumber: themeNumber);
  }
}
