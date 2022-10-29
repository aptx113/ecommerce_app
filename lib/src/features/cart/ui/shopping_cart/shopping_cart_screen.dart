import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/models/cart.dart';
import 'package:ecommerce_app/src/features/cart/ui/shopping_cart/shopping_cart_screen_controller.dart';
import 'package:ecommerce_app/src/utils/async_value_ui.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../routing/app_router.dart';
import 'shopping_cart_item.dart';
import 'shopping_cart_item_builder.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      shoppingCartScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).shoppingCart),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartValue = ref.watch(cartStreamProvider);
          return AsyncValueWidget(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.toItemsList(),
              itemBuilder: (_, item, index) =>
                  ShoppingCartItem(item: item, itemIndex: index),
              ctaBuilder: (_) => PrimaryButton(
                isLoading: state.isLoading,
                text: AppLocalizations.of(context).checkout,
                onPressed: () => context.pushNamed(AppRoute.checkout.name),
              ),
            ),
          );
        },
      ),
    );
  }
}
