// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/src/routing/app_router.dart';
import 'package:ecommerce_app/src/utils/date_formatter.dart';

import '../../../../common_widgets/custom_text_button.dart';
import '../../../../common_widgets/responsive_two_column_layout.dart';
import '../../../../constants/app_sizes.dart';
import '../../../orders/models/purchase.dart';

class LeaveReviewAction extends ConsumerWidget {
  const LeaveReviewAction({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchase = Purchase(orderId: 'abc', orderDate: DateTime.now());
    if (purchase != null) {
      final dateFormatted =
          ref.watch(dateFormatterProvider).format(purchase.orderDate);
      return Column(
        children: [
          const Divider(),
          gapH8,
          ResponsiveTwoColumnLayout(
            spacing: Sizes.p16,
            breakpoint: 300,
            startFlex: 3,
            endFlex: 2,
            rowMainAxisAligment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAligment: CrossAxisAlignment.center,
            columnCrossAxisAligment: CrossAxisAlignment.center,
            startContent: Text(
                AppLocalizations.of(context).purchasedOnDate(dateFormatted)),
            endContent: CustomTextButton(
              text: AppLocalizations.of(context).leaveReview,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.green[700],
                  ),
              onPressed: () => context.goNamed(
                AppRoute.leaveReview.name,
                params: {'id': productId},
              ),
            ),
          ),
          gapH8,
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
