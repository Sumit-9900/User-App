import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_app/core/theme/app_pallete.dart';

class AppTheme {
  /// Dark Theme
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: DarkAppPalette.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkAppPalette.cardColor,
      titleTextStyle: TextStyle(fontSize: 20, color: DarkAppPalette.textColor),
      elevation: 2,
    ),
    cardColor: DarkAppPalette.cardColor,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: DarkAppPalette.textColor,
    ),
    dividerColor: DarkAppPalette.dividerColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: DarkAppPalette.loadingIndicatorColor,
    ),
  );

  /// Light Theme
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: LightAppPalette.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: LightAppPalette.cardColor,
      titleTextStyle: TextStyle(fontSize: 20, color: LightAppPalette.textColor),
      elevation: 2,
    ),
    cardColor: LightAppPalette.cardColor,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: LightAppPalette.textColor,
    ),
    dividerColor: LightAppPalette.dividerColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: LightAppPalette.loadingIndicatorColor,
    ),
  );
}
