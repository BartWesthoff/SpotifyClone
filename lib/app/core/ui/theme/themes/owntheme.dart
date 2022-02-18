import 'package:flutter/material.dart';

extension customtheme on ThemeData {
  Color get invertedTextColor =>
      this.brightness == Brightness.dark ? Colors.white : Colors.black;
}
