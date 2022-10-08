// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/custom_image.dart';
import '../../../constants/app_sizes.dart';
import '../../../localization/app_localizations_context.dart';
import '../../cart/models/item.dart';
import '../../products/data/fake_products_repository.dart';
import '../../products/models/product.dart';

class OrderItemListTile extends ConsumerWidget {
  const OrderItemListTile({
    super.key,
    required this.item,
  });
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productStreamProvider(item.productId));
    return AsyncValueWidget<Product?>(
      value: productValue,
      data: (product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomImage(
                imageUrl: product!.imageUrl,
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
                    context.loc!.quantityValue(item.quantity),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
