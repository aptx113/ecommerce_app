// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';

class ShoppingCartIcon extends ConsumerWidget {
  const ShoppingCartIcon({super.key});

  static const shoppingCartIconKey = Key('shopping-cart');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsCount = ref.watch(cartItemsCountProvider);
    return Stack(
      children: [
        Center(
          child: IconButton(
            key: shoppingCartIconKey,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.pushNamed(AppRoute.cart.name),
          ),
        ),
        if (cartItemsCount > 0)
          Positioned(
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
    super.key,
    required this.itemCount,
  });
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
