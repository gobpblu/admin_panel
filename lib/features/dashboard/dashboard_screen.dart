import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin_panel/features/dashboard/responsive/dashboard_desktop_screen.dart';
import 'package:ecommerce_admin_panel/features/dashboard/responsive/dashboard_mobile_screen.dart';
import 'package:ecommerce_admin_panel/features/dashboard/responsive/dashboard_tablet_screen.dart';
import 'package:flutter/cupertino.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      desktop: DashboardDesktopScreen(),
      tablet: DashboardTabletScreen(),
      mobile: DashboardMobileScreen(),
    );
  }
}
