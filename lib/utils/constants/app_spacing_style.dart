import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    left: AppSizes.defaultSpace,
    top: AppSizes.appBarHeight,
    right: AppSizes.defaultSpace,
    bottom: AppSizes.defaultSpace,
  );
}
