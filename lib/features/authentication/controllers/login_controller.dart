import 'package:ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:ecommerce_admin_panel/features/authentication/data/models/app_role.dart';
import 'package:ecommerce_admin_panel/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_admin_panel/features/authentication/data/repository/user_repository.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_texts.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_admin_panel/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const rememberMeEmailKey = 'REMEMBER_ME_EMAIL';
const rememberMePasswordKey = 'REMEMBER_ME_EMAIL';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read(rememberMeEmailKey) ?? '';
    password.text = localStorage.read(rememberMePasswordKey) ?? '';
    super.onInit();
  }

  void changeHidePassword() {
    hidePassword.value = !hidePassword.value;
  }

  void changeRememberMe(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  Future<void> registerAdmin() async {
    try {
      TFullScreenLoader.openLoadingDialog('Registering Admin Account...', AppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.registerWithEmailAndPassword(AppTexts.adminEmail, AppTexts.adminPassword);

      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(
        UserModel(
          id: AuthenticationRepository.instance.authUser!.uid,
          firstName: 'Max',
          lastName: 'Abramov',
          email: AppTexts.adminEmail,
          role: AppRole.admin,
          createdAt: DateTime.now(),
        ),
      );

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.redirectScreen();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'When registering', message: e.toString());
    }
  }

  Future<void> signIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Signing in...', AppImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write(rememberMeEmailKey, email.text.trim());
        localStorage.write(rememberMePasswordKey, password.text.trim());
      }

      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      final user = await UserController.instance.fetchUserDetails();

      TFullScreenLoader.stopLoading();

      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        AppLoaders.errorSnackBar(
            title: 'Not Authorized', message: 'You are not authorized or do have access. Contact admin');
      } else {
        AuthenticationRepository.instance.redirectScreen();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Something went wrong', message: e.toString());
    }
  }
}
