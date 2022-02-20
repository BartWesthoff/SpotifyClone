import 'package:flutter/material.dart';

Color primarycolor = const Color(0xff1db954);
ThemeData darkTheme = ThemeData(
  backgroundColor: const Color(0xffFAFAFA),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primarycolor,
    primary: primarycolor,
    brightness: Brightness.dark,
    outline: primarycolor,
  ),
);
