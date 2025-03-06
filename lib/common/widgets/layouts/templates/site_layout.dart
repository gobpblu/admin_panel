import 'package:ecommerce_admin_panel/common/widgets/responsive/responsive_widget.dart';
import 'package:ecommerce_admin_panel/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:ecommerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:ecommerce_admin_panel/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:flutter/material.dart';

class SiteTemplate extends StatelessWidget {
  const SiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.useLayout = true,
  });

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        desktop: useLayout
            ? DesktopLayout(body: desktop)
            : desktop ?? const SizedBox(),
        tablet: useLayout
            ? TabletLayout(body: tablet ?? desktop)
            : tablet ?? desktop ?? const SizedBox(),
        mobile: useLayout
            ? MobileLayout(body: mobile ?? desktop)
            : mobile ?? desktop ?? const SizedBox(),
      ),
    );
  }
}
