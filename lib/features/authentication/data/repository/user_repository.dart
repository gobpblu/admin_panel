import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_admin_panel/utils/failures/failure_mixin.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController with FailureMixin {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    callWithTryCatch(() async {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    });
  }
}