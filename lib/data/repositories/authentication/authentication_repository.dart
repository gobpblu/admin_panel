import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/failures/failure_mixin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController with FailureMixin {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthenticated => authUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  void redirectScreen() async {
    final user = _auth.currentUser;

    if (user != null) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    return callWithTryCatch(() async {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    });
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    return callWithTryCatch(() async {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    });
  }

  Future<void> logout() async {
    await callWithTryCatch(() async {
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
