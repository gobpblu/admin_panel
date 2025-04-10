import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

/* -- Light & Dark Outlined Button Themes -- */
class AdminPanelOutlinedButtonTheme {
  AdminPanelOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.dark,
      side: const BorderSide(color: AppColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.light,
      side: const BorderSide(color: AppColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: AppColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}
