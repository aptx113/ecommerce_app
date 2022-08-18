// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/breakpoints.dart';

/// Responsive layout that shows two child widgets side by side if there is
/// enough space, or vertically stacked if there is not enough space.
class ResponsiveTwoColumnLayout extends StatelessWidget {
  const ResponsiveTwoColumnLayout({
    Key? key,
    required this.startContent,
    required this.endContent,
    this.startFlex = 1,
    this.endFlex = 1,
    this.breakpoint = Breakpoint.tablet,
    required this.spacing,
    this.rowMainAxisAligment = MainAxisAlignment.start,
    this.rowCrossAxisAligment = CrossAxisAlignment.start,
    this.columnMainAxisAligment = MainAxisAlignment.start,
    this.columnCrossAxisAligment = CrossAxisAlignment.stretch,
  }) : super(key: key);
  final Widget startContent;
  final Widget endContent;
  final int startFlex;
  final int endFlex;
  final double breakpoint;
  final double spacing;
  final MainAxisAlignment rowMainAxisAligment;
  final CrossAxisAlignment rowCrossAxisAligment;
  final MainAxisAlignment columnMainAxisAligment;
  final CrossAxisAlignment columnCrossAxisAligment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= breakpoint) {
        return Row(
          mainAxisAlignment: rowMainAxisAligment,
          crossAxisAlignment: rowCrossAxisAligment,
          children: [
            Flexible(flex: startFlex, child: startContent),
            SizedBox(width: spacing),
            Flexible(flex: endFlex, child: endContent)
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: columnMainAxisAligment,
          crossAxisAlignment: columnCrossAxisAligment,
          children: [
            startContent,
            SizedBox(height: spacing),
            endContent,
          ],
        );
      }
    });
  }
}
