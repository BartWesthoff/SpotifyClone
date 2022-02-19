import 'package:flutter/material.dart';

Color primarycolor = Color(0xff1db954);
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primarycolor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primarycolor,
    primary: primarycolor,
    outline: Colors.grey,
    brightness: Brightness.light,
  ),
);
