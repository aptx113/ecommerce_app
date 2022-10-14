// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/src/utils/currency_formatter.dart';

import '../../../../common_widgets/alert_dialogs.dart';
import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/custom_image.dart';
import '../../../../common_widgets/item_quantity_selector.dart';
import '../../../../common_widgets/responsive_two_column_layout.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../localization/app_localizations_context.dart';
import '../../../products/data/fake_products_repository.dart';
import '../../../products/models/product.dart';
import '../../models/item.dart';

class ShoppingCartItem extends ConsumerWidget {
  const ShoppingCartItem({
    super.key,
    required this.item,
    required this.itemIndex,
    this.isEditable = true,
  });
  final Item item;
  final int itemIndex;
  final bool isEditable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productStreamProvider(item.productId));
    return AsyncValueWidget<Product?>(
      value: productValue,
      data: (product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p8),
            child: ShoppingCartItemContents(
              product: product!,
              item: item,
              itemIndex: itemIndex,
              isEditable: isEditable,
            ),
          ),
        ),
      ),
    );
  }
}

class ShoppingCartItemContents extends ConsumerWidget {
  const ShoppingCartItemContents({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
    required this.isEditable,
  });
  final Product product;
  final Item item;
  final int itemIndex;
  final bool isEditable;

  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted =
        ref.watch(currencyFormatterProvider).format(product.price);
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
              ? EditOrRemoveItemWidget(
                  product: product,
                  item: item,
                  itemIndex: itemIndex,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                  child: Text(
                    context.loc.quantityValue(item.quantity),
                  ),
                )
        ],
      ),
    );
  }
}

class EditOrRemoveItemWidget extends ConsumerWidget {
  const EditOrRemoveItemWidget({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
  });
  final Product product;
  final Item item;
  final int itemIndex;

  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
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
    );
  }
}
