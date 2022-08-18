// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import 'cart_total_text.dart';

class CartTotalWithCallToAction extends StatelessWidget {
  const CartTotalWithCallToAction({
    Key? key,
    required this.ctaBuilder,
  }) : super(key: key);
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CartTotalText(),
        gapH8,
        ctaBuilder(context),
        gapH8,
      ],
    );
  }
}
