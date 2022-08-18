import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/item.dart';
import '../checkout/checkout_screen.dart';
import 'shopping_cart_item.dart';
import 'shopping_cart_item_builder.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cartItemsList = [
      Item(productId: '1', quantity: 1),
      Item(productId: '2', quantity: 2),
      Item(productId: '3', quantity: 3),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'.hardcoded),
      ),
      body: ShoppingCartItemsBuilder(
        items: cartItemsList,
        itemBuilder: (_, item, index) =>
            ShoppingCartItem(item: item, itemIndex: index),
        ctaBuilder: (_) => PrimaryButton(
          text: 'Checkout'.hardcoded,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => const CheckoutScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
