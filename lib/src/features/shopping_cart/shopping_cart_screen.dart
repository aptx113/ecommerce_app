import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../common_widgets/primary_button.dart';
import '../../models/item.dart';
import '../../routing/app_router.dart';
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
        title: Text(AppLocalizations.of(context)!.shoppingCart),
      ),
      body: ShoppingCartItemsBuilder(
        items: cartItemsList,
        itemBuilder: (_, item, index) =>
            ShoppingCartItem(item: item, itemIndex: index),
        ctaBuilder: (_) => PrimaryButton(
          text: AppLocalizations.of(context)!.checkout,
          onPressed: () => context.pushNamed(AppRoute.checkout.name),
        ),
      ),
    );
  }
}
