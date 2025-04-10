import 'package:ecommerce_admin_panel/features/dashboard/widgets/dashboard_card.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AppSizes.spaceBtwSections),
              const Row(
                children: [
                  Expanded(child: DashboardCard(stats: 25, title: 'Sales total', subtitle: '\$363.2')),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Expanded(child: DashboardCard(stats: 77, title: 'Average Order Value', subtitle: '\$23')),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const Row(
                children: [
                  Expanded(child: DashboardCard(stats: 13, title: 'Total orders', subtitle: '\$3.2')),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Expanded(child: DashboardCard(stats: 2, title: 'Visitors', subtitle: '\$77.7')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
