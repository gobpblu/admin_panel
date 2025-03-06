import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DeviceUtils {
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppSizes.minDesktopWidth;
  }

  static bool isTabletScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppSizes.minTabletWidth && width < AppSizes.minDesktopWidth;
  }

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < AppSizes.minTabletWidth;
  }
}
