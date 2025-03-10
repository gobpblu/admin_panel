import 'package:ecommerce_admin_panel/common/bindings/general_bindings.dart';
import 'package:ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin_panel/routes/app_router.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/routes/route_observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      getPages: AppRouter.pages,
      initialRoute: AppRoutes.dashboard,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const Scaffold(body: Center(child: Text('Page Not Found'))),
      ),
      initialBinding: GeneralBindings(),
      navigatorObservers: [
        AppRouteObserver(),
      ],
      // darkTheme: ,
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: const Center(
        child: Column(
          children: [Text('Simple Navigation: Default Flutter Navigator VS Get')],
        ),
      ),
      tablet: const Center(
        child: Column(
          children: [Text('Simple Navigation: Default Flutter Navigator VS Get')],
        ),
      ),
    );
  }
}
