// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/breakpoints.dart';
import '../../models/review.dart';
import 'product_review_card.dart';

class ProductReviewsList extends StatelessWidget {
  const ProductReviewsList({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  Widget build(BuildContext context) {
    final reviews = <Review>[
      Review(
        date: DateTime(2022, 2, 12),
        score: 4.5,
        comment: 'Great product, would buy again!',
      ),
      Review(
        date: DateTime(2022, 2, 10),
        score: 4.0,
        comment: 'Looks great but the packaging was damaged.',
      )
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ResponsiveCenter(
          maxContentWidth: Breakpoint.tablet,
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          child: ProductReviewCard(reviews[index]),
        ),
        childCount: reviews.length,
      ),
    );
  }
}
