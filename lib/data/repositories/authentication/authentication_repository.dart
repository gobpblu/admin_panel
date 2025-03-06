import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/failures/firebase_auth_failure.dart';
import 'package:ecommerce_admin_panel/utils/failures/firebase_failure.dart';
import 'package:ecommerce_admin_panel/utils/failures/format_failure.dart';
import 'package:ecommerce_admin_panel/utils/failures/platform_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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

  Future<UserCredential> callWithTryCatch(Future<UserCredential> Function() fun) async {
    try {
      // return await _auth.signInWithEmailAndPassword(email: email, password: password);
      return fun();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthFailure(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseFailure(e.code).message;
    } on FormatException catch (e) {
      throw const FormatFailure();
    } on PlatformException catch (e) {
      throw PlatformFailure(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
