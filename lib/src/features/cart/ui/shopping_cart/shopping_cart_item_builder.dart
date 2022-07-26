// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common_widgets/decorated_box_with_shadow.dart';
import '../../../../common_widgets/empty_placeholder_widget.dart';
import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/breakpoints.dart';
import '../../../../localization/app_localizations_context.dart';
import '../../models/item.dart';
import '../cart_total/cart_total_with_call_to_action.dart';

class ShoppingCartItemsBuilder extends StatelessWidget {
  const ShoppingCartItemsBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.ctaBuilder,
  });
  final List<Item> items;
  final Widget Function(BuildContext, Item, int) itemBuilder;
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return EmptyPlaceholderWidget(
        message: context.loc!.shoppingCartEmpty,
      );
    }
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= Breakpoint.tablet) {
      return ResponsiveCenter(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return itemBuilder(context, item, index);
                },
              ),
            ),
            gapW16,
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.p16,
                ),
                child: CartTotalWithCallToAction(ctaBuilder: ctaBuilder),
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(Sizes.p16),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return itemBuilder(context, item, index);
              },
            ),
          ),
          DecoratedBoxWithShadow(
            child: CartTotalWithCallToAction(
              ctaBuilder: ctaBuilder,
            ),
          )
        ],
      );
    }
  }
}
