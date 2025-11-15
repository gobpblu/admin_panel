import 'package:ecommerce_admin_panel/common/widgets/containers/circular_container.dart';
import 'package:ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/dashboard/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderStatusPieChart extends StatelessWidget {
  const OrderStatusPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController.instance;
    return RoundedContainer(
      // height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Orders Status',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),

          // Graph
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                sectionsSpace: 5.0,
                sections: controller.orderStatusData.entries.map((order) {
                  final status = order.key;
                  final count = order.value;

                  return PieChartSectionData(
                    title: count.toString(),
                    value: count.toDouble(),
                    radius: 100,
                    color: HelperFunctions.getOrderStatusColor(status),
                    titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  );
                }).toList(),
              ),
            ),
          ),

          // Show Status and Color Meta
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Orders')),
                DataColumn(label: Text('Total')),
              ],
              rows: controller.orderStatusData.entries.map((order) {
                final status = order.key;
                final count = order.value;
                final totalAmount = controller.totalAmounts[status] ?? 0;

                return DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          CircularContainer(
                            width: 20,
                            height: 20,
                            backgroundColor: HelperFunctions.getOrderStatusColor(status),
                          ),
                          Expanded(child: Text(' ${status.getDisplayName()}'))
                        ],
                      ),
                    ),
                    DataCell(Text(count.toString())),
                    DataCell(Text('\$${totalAmount.toStringAsFixed(2)}')),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
