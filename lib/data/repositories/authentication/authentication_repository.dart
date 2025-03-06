import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthenticated => authUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

}
