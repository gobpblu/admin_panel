import 'package:ecommerce_admin_panel/features/dashboard/presentation/table/data_table.dart';
import 'package:ecommerce_admin_panel/features/dashboard/widgets/dashboard_card.dart';
import 'package:ecommerce_admin_panel/features/dashboard/widgets/order_status_pie_chart.dart';
import 'package:ecommerce_admin_panel/features/dashboard/widgets/weekly_sales_graph_widget.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Cards
              const Row(
                children: [
                  Expanded(child: DashboardCard(stats: 25, title: 'Sales total', subtitle: '\$363.2')),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Expanded(child: DashboardCard(stats: 77, title: 'Average Order Value', subtitle: '\$23')),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Expanded(child: DashboardCard(stats: 13, title: 'Total orders', subtitle: '\$3.2')),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Expanded(child: DashboardCard(stats: 2, title: 'Visitors', subtitle: '\$77.7')),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Graphs
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        /// Bar Graph
                        WeeklySalesBarGraphWidget(),
                        SizedBox(height: AppSizes.spaceBtwSections),

                        /// Orders
                        DashboardOrderTable(),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceBtwSections),

                  /// Pie Chart
                  Expanded(child: OrderStatusPieChart()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
