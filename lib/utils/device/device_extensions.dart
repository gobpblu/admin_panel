import 'package:flutter/material.dart';

import 'device_utils.dart';

extension DeviceExtensions on BuildContext {
  bool get isMobileScreen => DeviceUtils.isMobileScreen(this);
  bool get isDesktopScreen => DeviceUtils.isDesktopScreen(this);
  bool get isTabletScreen => DeviceUtils.isTabletScreen(this);
}
