// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common_widgets/custom_image.dart';
import '../../constants/app_sizes.dart';
import '../../constants/test_products.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/item.dart';

class OrderItemListTile extends StatelessWidget {
  const OrderItemListTile({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    final product = testProducts.firstWhere(
      (product) => product.id == item.productId,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: CustomImage(
              imageUrl: product.imageUrl,
            ),
          ),
          gapW8,
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                gapH12,
                Text(
                  'Quantity: ${item.quantity}'.hardcoded,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
