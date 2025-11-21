import 'package:ecommerce_admin_panel/common/widgets/breadcrumbs/page_heading.dart';
import 'package:ecommerce_admin_panel/routes/app_routes.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BreadcrumbsWithHeading extends StatelessWidget {
  const BreadcrumbsWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbItems,
    this.hasReturnButton = false,
  });

  final String heading;
  final List<String> breadcrumbItems;
  final bool hasReturnButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const _DashboardLink(),
            for (int i = 0; i < breadcrumbItems.length; i++)
              _PathLink(breadcrumb: breadcrumbItems[i], index: i, isLast: i == breadcrumbItems.length - 1),
          ],
        ),
        const SizedBox(height: AppSizes.sm),
        _HeadingWidget(heading: heading, hasReturnButton: hasReturnButton),
      ],
    );
  }
}

class _HeadingWidget extends StatelessWidget {
  const _HeadingWidget({required this.heading, required this.hasReturnButton});

  final String heading;
  final bool hasReturnButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (hasReturnButton) ...[
          IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
          const SizedBox(width: AppSizes.spaceBtwItems),
        ],
        PageHeading(heading: heading)
      ],
    );
  }
}

class _PathLink extends StatelessWidget {
  const _PathLink({required this.breadcrumb, required this.index, required this.isLast});

  final String breadcrumb;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('/'),
        InkWell(
          onTap: isLast ? null : () => Get.toNamed(breadcrumb),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.xs),
            child: Text(
              isLast ? breadcrumb.capitalize.toString() : capitalizeFirst(breadcrumb.substring(1)),
              style: Theme.of(context).textTheme.bodySmall?.apply(fontWeightDelta: -1),
            ),
          ),
        ),
      ],
    );
  }

  String capitalizeFirst(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}

class _DashboardLink extends StatelessWidget {
  const _DashboardLink();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.offAllNamed(AppRoutes.dashboard),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xs),
        child: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.bodySmall?.apply(fontWeightDelta: -1),
        ),
      ),
    );
  }
}
