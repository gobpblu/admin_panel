import 'package:ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin_panel/features/dashboard/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ecommerce_admin_panel/utils/device/device_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeeklySalesBarGraphWidget extends StatelessWidget {
  const WeeklySalesBarGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return RoundedContainer(
      child: Column(
        children: [
          Text('Weekly Sales', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                titlesData: buildTitlesData(),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide.none,
                    left: BorderSide.none,
                  ),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  horizontalInterval: 200,
                ),
                barGroups: controller.weeklySales
                    .asMap()
                    .entries
                    .map((entry) => BarChartGroupData(
                          x: entry.key,
                          barRods: [
                            BarChartRodData(
                              width: 30,
                              toY: entry.value,
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(AppSizes.sm),
                            ),
                          ],
                        ))
                    .toList(),
                groupsSpace: AppSizes.spaceBtwItems,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(getTooltipColor: (_) => AppColors.secondary),
                  touchCallback: DeviceUtils.isDesktopScreen(context)
                      ? (barTouchEvent, barTouchResponse) {}
                      : (barTouchEvent, barTouchResponse) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FlTitlesData buildTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            final index = value.toInt() % days.length;

            final day = days[index];

            return SideTitleWidget(
              child: Text(day),
              meta: meta,
              space: 0,
            );
          },
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: true, interval: 200, reservedSize: 50),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
