import 'package:ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.route,
    required this.title,
    required this.icon,
  });

  final String route;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.tapOnMenu(route),
      onHover: (isHovering) => isHovering ? menuController.changeHoverItem(route) : menuController.changeHoverItem(''),
      child: Obx(() {
        final isActive = menuController.isActive(route);
        final isHovering = menuController.isHovering(route);
        return Container(
          margin: const EdgeInsets.symmetric(vertical: AppSizes.xs),
          decoration: BoxDecoration(
            color: isHovering || isActive ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.md),
                child: isActive
                    ? Icon(icon, size: 22, color: AppColors.white)
                    : Icon(icon, size: 22, color: isHovering ? AppColors.white : AppColors.darkGrey),
              ),
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isHovering || isActive ? AppColors.white : AppColors.darkGrey,
                      ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
