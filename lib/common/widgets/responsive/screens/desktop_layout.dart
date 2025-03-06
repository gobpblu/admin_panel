import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/side_drawer.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/headers/header.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: AppSideDrawer()),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  // HEADER
                  HeaderWidget(),
                  // BODY
                  body ?? const SizedBox(),
                ],
              )),
        ],
      ),
    );
  }
}
