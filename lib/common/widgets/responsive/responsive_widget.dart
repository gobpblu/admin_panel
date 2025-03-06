import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= AppSizes.minDesktopWidth) {
          return desktop;
        } else if (constraints.maxWidth >= AppSizes.minTabletWidth) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
