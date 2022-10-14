// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common_widgets/alert_dialogs.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/breakpoints.dart';
import '../../models/review.dart';
import '../product_reviews/product_rating_bar.dart';

class LeaveReviewScreen extends StatelessWidget {
  const LeaveReviewScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    const review = null;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).leaveReview),
      ),
      body: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        padding: const EdgeInsets.all(Sizes.p16),
        child: LeaveReviewForm(
          productId: productId,
          review: review,
        ),
      ),
    );
  }
}

class LeaveReviewForm extends StatefulWidget {
  const LeaveReviewForm({super.key, required this.productId, this.review});
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
            AppLocalizations.of(context).previouslyReviewedHint,
            textAlign: TextAlign.center,
          ),
          gapH24,
        ],
        Center(
          child: ProductRatingBar(
            initialRating: _rating,
            onRatingUpdate: (rating) => setState(
              () {
                _rating = rating;
              },
            ),
          ),
        ),
        gapH32,
        TextField(
          key: LeaveReviewForm.reviewCommentKey,
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).yourReviewHint,
            border: const OutlineInputBorder(),
          ),
        ),
        gapH32,
        PrimaryButton(
          text: AppLocalizations.of(context).submit,
          isLoading: false,
          onPressed: _rating == 0 ? null : _submitReview,
        )
      ],
    );
  }
}
