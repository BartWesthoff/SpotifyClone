import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final int themeNumber;

  ThemeChanged({
    required this.themeNumber,
  });
}
