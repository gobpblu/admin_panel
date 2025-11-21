import 'package:ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Breadcrumbs
                  const BreadcrumbsWithHeading(
                    heading: 'Media',
                    breadcrumbItems: [],
                  ),

                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Iconsax.cloud_add),
                    label: const Text('Upload Images'),
                  ),
                ],
              ),

              SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
