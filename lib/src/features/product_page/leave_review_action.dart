// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common_widgets/custom_text_button.dart';
import '../../common_widgets/responsive_two_column_layout.dart';
import '../../constants/app_sizes.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/purchase.dart';
import '../../utils/date_formatter.dart';

class LeaveReviewAction extends StatelessWidget {
  const LeaveReviewAction({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    final purchase = Purchase(orderId: 'abc', orderDate: DateTime.now());
    if (purchase != null) {
      final dataFormatted = dataFormatter.format(purchase.orderDate);
      return Column(children: [
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
          startContent: Text('Purchased on $dataFormatted'.hardcoded),
          endContent: CustomTextButton(
            text: 'Leave a review'.hardcoded,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.green[700]),
          ),
        )
      ]);
    } else {
      return const SizedBox();
    }
  }
}
