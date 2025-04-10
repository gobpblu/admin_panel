import 'package:ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.color = AppColors.success,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final int stats;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Column(
        children: [
          SectionHeading(title: title, textColor: AppColors.textSecondary),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
              Text(subtitle, style: Theme.of(context).textTheme.headlineMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(icon, color: color, size: AppSizes.iconSm),
                        Text(
                          '$stats%',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                color: color,
                                overflow: TextOverflow.ellipsis,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Text(
                      'Compared to Dec 2025',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
