import 'package:flutter/material.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final int themeNumber;

  const ThemeChanged({
    required this.themeNumber,
  });
}
