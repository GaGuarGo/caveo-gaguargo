import 'package:caveo_gaguargo/shared/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: kPrimaryColor,
    brightness: Brightness.light,
    primaryColorLight: kPrimaryColor,
    primaryColorDark: kSecondaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kSecondaryColor,
    ),
  );
}
