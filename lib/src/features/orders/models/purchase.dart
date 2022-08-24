// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'order.dart';

class Purchase {
  const Purchase({
    required this.orderId,
    required this.orderDate,
  });

  final OrderID orderId;
  final DateTime orderDate;
}
