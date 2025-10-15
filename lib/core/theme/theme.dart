import 'package:caveo_gaguargo/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: kPrimaryColor,
    brightness: Brightness.light,
    primaryColorLight: kPrimaryColor,
    primaryColorDark: kSecondaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor),
    textTheme: GoogleFonts.montserratTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
