// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common_widgets/custom_image.dart';
import '../../constants/app_sizes.dart';
import "../../localization/string_hardcoded.dart";
import '../../models/product.dart';
import '../../utils/currency_formatter.dart';
import '../product_page/product_average_rating.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.onPressed,
  }) : super(key: key);
  final Product product;
  final VoidCallback? onPressed;

  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context) {
    final priceFormatted = currencyFormatter.format(product.price);
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomImage(imageUrl: product.imageUrl),
              gapH8,
              const Divider(),
              gapH8,
              Text(
                product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              if (product.numRatings >= 1) ...[
                gapH8,
                ProductAverageRating(product: product),
              ],
              gapH24,
              Text(
                priceFormatted,
                style: Theme.of(context).textTheme.headline5,
              ),
              gapH4,
              Text(
                product.availableQuantity <= 0
                    ? 'Out of Stock'.hardcoded
                    : 'Quantity: ${product.availableQuantity}'.hardcoded,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
