import 'package:flutter/material.dart';

import '../../common_widgets/alert_dialogs.dart';
import '../../common_widgets/primary_button.dart';
import '../../constants/app_sizes.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/review.dart';
import '../product_page/product_reviews/product_rating_bar.dart';

class LeaveReviewForm extends StatefulWidget {
  const LeaveReviewForm({Key? key, required this.productId, this.review})
      : super(key: key);
  final String productId;
  final Review? review;

  static const reviewCommentKey = Key('reviewComment');

  @override
  State<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends State<LeaveReviewForm> {
  final _controller = TextEditingController();

  double _rating = 0;

  @override
  void initState() {
    super.initState();
    final review = widget.review;
    if (review != null) {
      _controller.text = review.comment;
      _rating = review.score;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    await showNotImplementedAlertDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.review != null) ...[
          Text(
            'You reviewed this product before. Submit again to edit.'.hardcoded,
            textAlign: TextAlign.center,
          ),
          gapH32,
        ],
        Center(
          child: ProductRatingBar(
            initialRating: _rating,
            onRatingUpdate: (rating) => setState(() {
              _rating = rating;
            }),
          ),
        ),
        gapH32,
        PrimaryButton(
          text: 'Submit'.hardcoded,
          isLoading: false,
          onPressed: _rating == 0 ? null : _submitReview,
        )
      ],
    );
  }
}
