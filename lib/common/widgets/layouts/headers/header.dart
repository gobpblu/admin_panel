import 'package:ecommerce_admin_panel/common/widgets/images/image_type.dart';
import 'package:ecommerce_admin_panel/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecommerce_admin_panel/utils/device/device_extensions.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey, width: 1.0)),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md, vertical: AppSizes.sm),
      child: AppBar(
        leading: !DeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu),
              )
            : null,
        title: SizedBox(
          width: 400,
          child: context.isDesktopScreen
              ? TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.search_normal),
                    hintText: 'Search anything...',
                  ),
                )
              : null,
        ),
        actions: [
          if (!context.isDesktopScreen)
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal),
            ),

          // Notification icon
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: AppSizes.spaceBtwItems),

          // User data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RoundedImage(
                imageType: ImageType.asset,
                width: 40,
                padding: 2,
                height: 40,
                image: AppImages.user,
              ),
              SizedBox(width: AppSizes.sm),

              // Name and Email
              if (!context.isMobileScreen)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coding with gobpo2002',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'gobpo2002@gmail.com',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight() + 15);
}
