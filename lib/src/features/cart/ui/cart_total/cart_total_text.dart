import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/utils/currency_formatter.dart';

class CartTotalText extends ConsumerWidget {
  const CartTotalText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartTotal = ref.watch(cartTotalProvider);
    final totalFormatted =
        ref.watch(currencyFormatterProvider).format(cartTotal);
    return Text(
      'Total: $totalFormatted',
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
    );
  }
}
