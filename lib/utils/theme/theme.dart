import 'package:flutter/material.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/appbar_theme.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/chip_theme.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:indoor_air_quality/utils/theme/custom_theme/outlined_button_theme.dart';
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
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      chipTheme: TChipTheme.lightChipTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      chipTheme: TChipTheme.darkChipTheme);
}