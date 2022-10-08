import 'package:ecommerce_app/src/common_widgets/alert_dialogs.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/string_hardcoded.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  Future<void> _pay(BuildContext context) async {
    showNotImplementedAlertDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: 'Pay'.hardcoded,
      isLoading: false,
      onPressed: () => _pay(context),
    );
  }
}
