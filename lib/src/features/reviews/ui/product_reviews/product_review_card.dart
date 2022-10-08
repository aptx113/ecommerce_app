import 'package:flutter/material.dart';

import '../../../../common_widgets/alert_dialogs.dart';
import '../../../../constants/app_sizes.dart';
import '../../models/review.dart';
import '../../../../utils/date_formatter.dart';
import 'product_rating_bar.dart';

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard(
    this.review, {
    super.key,
  });
  final Review review;
  @override
  Widget build(BuildContext context) {
    final dateFormatted = dataFormatter.format(review.date);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductRatingBar(
                  initialRating: review.score,
                  ignoreGesture: true,
                  itemSize: 20,
                  onRatingUpdate: (value) {
                    showNotImplementedAlertDialog(context: context);
                  },
                ),
                Text(
                  dateFormatted,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
            if (review.comment.isNotEmpty) ...[
              gapH16,
              Text(
                review.comment,
                style: Theme.of(context).textTheme.caption,
              )
            ]
          ],
        ),
      ),
    );
  }
}
