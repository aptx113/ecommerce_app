// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../models/product.dart';

class ProductAverageRating extends StatelessWidget {
  const ProductAverageRating({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        gapW8,
        Text(
          product.avgRating.toStringAsFixed(1),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        gapW8,
        Text(
          product.numRatings == 1 ? '1 raing' : '${product.numRatings} ratings',
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
