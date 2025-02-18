import 'package:flutter/material.dart';

/// Palette for the dark theme
class DarkAppPalette {
  static const Color textColor = Colors.white;
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color dividerColor = Colors.grey;
  static const Color titleColor = Colors.blueAccent;
  static const Color refreshIndicatorColor = Colors.tealAccent;
  static const Color loadingIndicatorColor = Colors.tealAccent;
}

/// Palette for the light theme
class LightAppPalette {
  static const Color textColor = Colors.black;
  static const Color cardColor = Color(0xFFF5F5F5);
  static const Color backgroundColor = Colors.white;
  static Color dividerColor = Colors.grey.shade400;
  static const Color titleColor = Colors.blue;
  static const Color refreshIndicatorColor = Colors.blueAccent;
  static const Color loadingIndicatorColor = Colors.blueAccent;
}
