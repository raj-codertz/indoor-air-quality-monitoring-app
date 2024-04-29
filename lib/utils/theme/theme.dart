import 'package:flutter/material.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/text_theme.dart';

class TAppTheme {

  // Make the constructor to be private
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: lightElevatedButtonTheme
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: darkElevatedButtonTheme
  );
}