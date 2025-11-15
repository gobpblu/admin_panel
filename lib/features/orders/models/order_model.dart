import 'package:ecommerce_admin_panel/features/orders/models/order_status.dart';
import 'package:ecommerce_admin_panel/utils/helpers/helper_functions.dart';

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

  String get formattedOrderDate => HelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => HelperFunctions.getFormattedDate(deliveryDate);
}
