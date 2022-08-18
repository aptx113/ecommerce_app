// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/app_sizes.dart';
import '../shopping_cart/shopping_cart_screen.dart';

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({Key? key}) : super(key: key);

  static const shoppingCartIconKey = Key('shopping-cart');

  @override
  Widget build(BuildContext context) {
    const cartItemsCount = 3;
    return Stack(
      children: [
        Center(
          child: IconButton(
            key: shoppingCartIconKey,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => const ShoppingCartScreen(),
              ),
            ),
          ),
        ),
        if (cartItemsCount > 0)
          const Positioned(
            top: Sizes.p4,
            right: Sizes.p4,
            child: ShoppingCartIconBadge(itemCount: cartItemsCount),
          )
      ],
    );
  }
}

class ShoppingCartIconBadge extends StatelessWidget {
  const ShoppingCartIconBadge({
    Key? key,
    required this.itemCount,
  }) : super(key: key);
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.p16,
      height: Sizes.p16,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$itemCount',
          textAlign: TextAlign.center,
          textScaleFactor: 1.0,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
