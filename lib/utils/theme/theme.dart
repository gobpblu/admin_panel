import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class AdminPanelAppTheme {
  AdminPanelAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AdminPanelTextTheme.lightTextTheme,
    chipTheme: AdminPanelChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AdminPanelAppBarTheme.lightAppBarTheme,
    checkboxTheme: AdminPanelCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AdminPanelBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AdminPanelElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AdminPanelOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AdminPanelTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: AdminPanelTextTheme.darkTextTheme,
    chipTheme: AdminPanelChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AdminPanelAppBarTheme.darkAppBarTheme,
    checkboxTheme: AdminPanelCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AdminPanelBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AdminPanelElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AdminPanelOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AdminPanelTextFormFieldTheme.darkInputDecorationTheme,
  );
}
