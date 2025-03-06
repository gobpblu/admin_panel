import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppRouteObserver extends GetObserver {
  /// Called when a route is popped from the navigation stack
  @override
  void didPop(Route route, Route? previousRoute) {
    print('route: $route, prevRoute: $previousRoute');
    if (previousRoute != null) {
      _changeActiveItem(previousRoute);
    }
  }

  @override
  void didPush(Route? route, Route? previousRoute) {
    if (route != null) {
      _changeActiveItem(route);
    }
  }

  void _changeActiveItem(Route route) {
    final sidebarController = Get.put(SidebarController());
    // Check the route name and update the active item in the sidebar accordingly
    for (var routeName in AppRoutes.sidebarMenuItems) {
      if (route.settings.name == routeName) {
        sidebarController.activeItem.value = routeName;
      }
    }
  }
}
