import 'package:ecommerce_admin_panel/features/orders/models/order_model.dart';
import 'package:ecommerce_admin_panel/features/orders/models/order_status.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT021',
      status: OrderStatus.processing,
      totalAmount: 200,
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now().add(const Duration(days: 2)),
    ),
    OrderModel(
      id: 'CWT022',
      status: OrderStatus.shipped,
      totalAmount: 20,
      orderDate: DateTime.now().subtract(Duration(days: 1)),
      deliveryDate: DateTime.now().add(const Duration(days: 1)),
    ),
    OrderModel(
      id: 'CWT023',
      status: OrderStatus.delivered,
      totalAmount: 300,
      orderDate: DateTime.now().subtract(Duration(days: 2)),
      deliveryDate: DateTime.now().add(const Duration(days: 3)),
    ),
    OrderModel(
      id: 'CWT024',
      status: OrderStatus.cancelled,
      totalAmount: 400,
      orderDate: DateTime.now().subtract(Duration(days: 3)),
      deliveryDate: DateTime.now().add(const Duration(days: 4)),
    ),
    OrderModel(
      id: 'CWT025',
      status: OrderStatus.processing,
      totalAmount: 500,
      orderDate: DateTime.now().subtract(Duration(days: 4)),
      deliveryDate: DateTime.now().add(const Duration(days: 5)),
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  void _calculateWeeklySales() {
    weeklySales.value = List<double>.filled(7, 0.0);
    for (var order in orders) {
      final orderWeekStart = HelperFunctions.getStartOfWeek(order.orderDate);

      if (orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;
      }
    }
  }
}
