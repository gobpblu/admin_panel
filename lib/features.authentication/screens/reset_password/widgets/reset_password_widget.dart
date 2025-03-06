import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_texts.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        /// Header
        Row(
          children: [
            IconButton(onPressed: () => Get.offAllNamed(AppRoutes.login), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        /// Image
        const Image(image: AssetImage(AppImages.deliveredEmailIllustration), width: 300, height: 300),
        const SizedBox(height: AppSizes.spaceBtwItems),

        // Title & Subtitle
        Text(
          AppTexts.changeYourPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Text(email, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Text(
          AppTexts.changeYourPasswordSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.offAllNamed(AppRoutes.login), child: const Text(AppTexts.done)),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: () {}, child: const Text(AppTexts.resendEmail)),
        ),
      ],
    );
  }
}
