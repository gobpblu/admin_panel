import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'firebase_auth_failure.dart';
import 'firebase_failure.dart';
import 'format_failure.dart';
import 'platform_failure.dart';

mixin FailureMixin {
  Future callWithTryCatch(Future Function() fun) async {
    try {
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
