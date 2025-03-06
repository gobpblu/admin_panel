import 'package:ecommerce_admin_panel/features/dashboard/dashboard_screen.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password_screen.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/login/login_screen.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password_screen.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/routes/routes_middleware.dart';
import 'package:get/get.dart';

class AppRouter {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [RouteMiddleware()]),
  ];
}
