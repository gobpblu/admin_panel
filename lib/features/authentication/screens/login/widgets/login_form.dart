import 'package:ecommerce_admin_panel/features/authentication/controllers/login_controller.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_texts.dart';
import 'package:ecommerce_admin_panel/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: Validator.validateEmail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: AppTexts.email,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwSections),

            // Password
            Obx(() {
              return TextFormField(
                controller: controller.password,
                validator: (value) => Validator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.direct_right),
                  labelText: AppTexts.password,
                  suffixIcon: IconButton(
                    onPressed: controller.changeHidePassword,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              );
            }),

            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            /// Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: controller.changeRememberMe)),
                    const Text(AppTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.forgetPassword),
                  child: const Text(AppTexts.forgetPassword),
                )
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // onPressed: controller.signInWithEmailAndPassword,
                onPressed: controller.signIn,
                child: const Text(AppTexts.signIn),
              ),
            )
          ],
        ),
      ),
    );
  }
}
