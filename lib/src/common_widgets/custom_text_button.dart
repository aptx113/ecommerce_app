import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.style,
    this.onPressed,
  });
  final String text;
  final TextStyle? style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
