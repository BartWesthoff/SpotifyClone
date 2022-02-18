import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/ui/theme/themes/themes.dart';

@immutable
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
