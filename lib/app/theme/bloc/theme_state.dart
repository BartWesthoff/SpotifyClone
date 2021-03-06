import 'package:flutter/material.dart';
import 'package:spotifyclone/app/theme/themes/themes.dart';

class ThemeState {
  final int themeNumber;
  late ThemeData theme;
  ThemeState({required this.themeNumber}) {
    if (themeNumber == 0) {
      theme = appThemeData[AppTheme.lightTheme]!;
    }
    if (themeNumber == 1) {
      theme = appThemeData[AppTheme.darkTheme]!;
    }
  }

  ThemeState copyWith({required int themeNumber}) {
    return ThemeState(themeNumber: themeNumber);
  }
}
