import 'package:ecommerce_admin_panel/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_admin_panel/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../data/repository/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      isLoading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      return user;
    } catch (e) {
      AppLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
      return UserModel.empty();
    } finally {
      isLoading.value = false;
    }
  }
}