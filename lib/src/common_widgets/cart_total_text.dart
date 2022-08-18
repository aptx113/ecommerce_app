import 'package:flutter/material.dart';

import '../utils/currency_formatter.dart';

class CartTotalText extends StatelessWidget {
  const CartTotalText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cartTotal = 104.0;
    final totalFormatted = currencyFormatter.format(cartTotal);
    return Text(
      'Total: $totalFormatted',
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
    );
  }
}
