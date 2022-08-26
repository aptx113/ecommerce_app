// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/custom_image.dart';
import '../../../constants/app_sizes.dart';
import '../../../localization/app_localizations_of.dart';
import '../../cart/models/item.dart';
import '../../products/data/fake_products_repository.dart';

class OrderItemListTile extends ConsumerWidget {
  const OrderItemListTile({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtcsRepository = ref.watch(productsRepositoryProvider);
    final product = produtcsRepository.getProduct(item.productId)!;
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
                  context.localizations!.quantityValue(item.quantity),
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
