// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common_widgets/cart_total_with_call_to_action.dart';
import '../../common_widgets/decorated_box_with_shadow.dart';
import '../../common_widgets/responsive_center.dart';
import '../../constants/app_sizes.dart';
import '../../constants/breakpoints.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/item.dart';
import '../not_found/empty_placeholder_widget.dart';

class ShoppingCartItemsBuilder extends StatelessWidget {
  const ShoppingCartItemsBuilder({
    Key? key,
    required this.items,
    required this.itemBuilder,
    required this.ctaBuilder,
  }) : super(key: key);
  final List<Item> items;
  final Widget Function(BuildContext, Item, int) itemBuilder;
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return EmptyPlaceholderWidget(
        message: 'Your shopping cart is empty'.hardcoded,
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
