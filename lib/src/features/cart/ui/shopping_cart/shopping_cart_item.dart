// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/alert_dialogs.dart';
import '../../../../common_widgets/custom_image.dart';
import '../../../../common_widgets/item_quantity_selector.dart';
import '../../../../common_widgets/responsive_two_column_layout.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/test_products.dart';
import '../../../../localization/app_localizations_of.dart';
import '../../../products/models/product.dart';
import '../../models/item.dart';


class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    Key? key,
    required this.item,
    required this.itemIndex,
    this.isEditable = true,
  }) : super(key: key);
  final Item item;
  final int itemIndex;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    final product =
        testProducts.firstWhere((product) => product.id == item.productId);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: ShoppingCartItemContents(
            product: product,
            item: item,
            itemIndex: itemIndex,
            isEditable: isEditable,
          ),
        ),
      ),
    );
  }
}

class ShoppingCartItemContents extends StatelessWidget {
  const ShoppingCartItemContents({
    Key? key,
    required this.product,
    required this.item,
    required this.itemIndex,
    required this.isEditable,
  }) : super(key: key);
  final Product product;
  final Item item;
  final int itemIndex;
  final bool isEditable;

  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context) {
    final priceFormatted = NumberFormat.simpleCurrency().format(product.price);
    return ResponsiveTwoColumnLayout(
      startFlex: 1,
      endFlex: 2,
      breakpoint: 320,
      startContent: CustomImage(imageUrl: product.imageUrl),
      spacing: Sizes.p24,
      endContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          gapH24,
          Text(
            priceFormatted,
            style: Theme.of(context).textTheme.headline5,
          ),
          gapH24,
          isEditable
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemQuantitySelector(
                      quantity: item.quantity,
                      maxQuantity: min(product.availableQuantity, 10),
                      itemIndex: itemIndex,
                      onChanged: (value) {
                        showNotImplementedAlertDialog(context: context);
                      },
                    ),
                    IconButton(
                      key: deleteKey(itemIndex),
                      onPressed: () {
                        showNotImplementedAlertDialog(context: context);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[700],
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                  child: Text(
                    context.localizations!.quantityValue(item.quantity),
                  ),
                )
        ],
      ),
    );
  }
}
