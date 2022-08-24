// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../localization/string_hardcoded.dart';

enum OrderStatus {
  confirmed('confirmed'),
  shipped('shipped'),
  delivered('delivered');

  const OrderStatus(this.value);
  final String value;
}

extension OrderStatusString on OrderStatus {
  static OrderStatus fromString(String string) {
    if (string == OrderStatus.confirmed.value) return OrderStatus.confirmed;
    if (string == OrderStatus.shipped.value) return OrderStatus.shipped;
    if (string == OrderStatus.delivered.value) return OrderStatus.delivered;
    throw Exception('Could not parse order status: $string'.hardcoded);
  }
}

typedef OrderID = String;

class Order {
  const Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.orderStatus,
    required this.orderDate,
    required this.total,
  });

  final OrderID id;
  final String userId;
  final Map<String, int> items;
  final OrderStatus orderStatus;
  final DateTime orderDate;
  final double total;
}
