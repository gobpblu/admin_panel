import 'package:ecommerce_admin_panel/common/widgets/images/image_type.dart';
import 'package:ecommerce_admin_panel/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'menu/menu_item.dart';

class AppSideDrawer extends StatelessWidget {
  const AppSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(right: BorderSide(color: AppColors.grey, width: 1.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RoundedImage(
                imageType: ImageType.asset,
                width: 100,
                height: 100,
                image: AppImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Padding(
                padding: EdgeInsets.all(AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2),
                    ),

                    // Menu Items
                    const MenuItem(route: AppRoutes.dashboard, title: 'Dashboard', icon: Iconsax.status),
                    const MenuItem(route: AppRoutes.media, title: 'Media', icon: Iconsax.image),
                    const MenuItem(route: AppRoutes.banners, title: 'Banners', icon: Iconsax.picture_frame),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
