import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_texts.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(width: 100, height: 100, image: AssetImage(AppImages.darkAppLogo)),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Text(AppTexts.loginTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSizes.sm),
          Text(AppTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
