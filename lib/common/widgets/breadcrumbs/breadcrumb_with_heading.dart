import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreadcrumbsWithHeading extends StatelessWidget {
  const BreadcrumbsWithHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Get.offAllNamed(AppRoutes.dashboard),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.xs),
            child: Text(
              'Dashboard',
              style: Theme.of(context).textTheme.bodySmall?.apply(fontWeightDelta: -1),
            ),
          ),
        ),
        SizedBox(height: AppSizes.sm),
      ],
    );
  }
}
