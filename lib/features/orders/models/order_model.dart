import 'package:ecommerce_admin_panel/features/orders/models/order_status.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryDate,
  });

  final String id;
  final OrderStatus status;
  final int totalAmount;
  final DateTime orderDate;
  final DateTime deliveryDate;
}
