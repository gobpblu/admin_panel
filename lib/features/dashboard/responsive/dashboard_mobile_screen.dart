import 'package:ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/dashboard/widgets/dashboard_card.dart';
import 'package:ecommerce_admin_panel/features/dashboard/widgets/order_status_pie_chart.dart';
import 'package:ecommerce_admin_panel/features/dashboard/widgets/weekly_sales_graph_widget.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

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

              const DashboardCard(stats: 25, title: 'Sales total', subtitle: '\$363.2'),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const DashboardCard(stats: 77, title: 'Average Order Value', subtitle: '\$23'),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const DashboardCard(stats: 13, title: 'Total orders', subtitle: '\$3.2'),
              const SizedBox(height: AppSizes.spaceBtwItems),
              const DashboardCard(stats: 2, title: 'Visitors', subtitle: '\$77.7'),

              const SizedBox(height: AppSizes.spaceBtwSections),

              const WeeklySalesBarGraphWidget(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Orders
              const RoundedContainer(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              const OrderStatusPieChart(),
            ],
          ),
        ),
      ),
    );
  }
}
