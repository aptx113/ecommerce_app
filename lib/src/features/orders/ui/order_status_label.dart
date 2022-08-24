// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../localization/string_hardcoded.dart';
import '../models/order.dart';

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    switch (order.orderStatus) {
      case OrderStatus.confirmed:
        return Text(
          'Confirmed - preparing for delivery'.hardcoded,
          style: textStyle,
        );
      case OrderStatus.shipped:
        return Text(
          'Shipped'.hardcoded,
          style: textStyle,
        );
      case OrderStatus.delivered:
        return Text(
          'Delivered'.hardcoded,
          style: textStyle?.copyWith(color: Colors.green),
        );
    }
  }
}
