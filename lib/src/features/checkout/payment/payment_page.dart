import 'package:flutter/material.dart';

import '../../cart/models/item.dart';
import '../../cart/ui/shopping_cart/shopping_cart_item.dart';
import '../../cart/ui/shopping_cart/shopping_cart_item_builder.dart';
import 'payment_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cartItemsList = [
      Item(productId: '1', quantity: 1),
      Item(productId: '2', quantity: 2),
      Item(productId: '3', quantity: 3),
    ];

    return ShoppingCartItemsBuilder(
      items: cartItemsList,
      itemBuilder: (_, item, index) => ShoppingCartItem(
        item: item,
        itemIndex: index,
        isEditable: false,
      ),
      ctaBuilder: (_) => const PaymentButton(),
    );
  }
}
