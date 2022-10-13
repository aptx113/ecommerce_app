// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({
    super.key,
    this.initialRating = 0.0,
    this.itemSize = 40,
    this.ignoreGesture = false,
    required this.onRatingUpdate,
  });

  final double initialRating;
  final double itemSize;
  final bool ignoreGesture;
  final ValueChanged<double> onRatingUpdate;

  static Key starRatingKey(int index) => Key('star-$index');

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      ignoreGestures: ignoreGesture,
      glow: false,
      allowHalfRating: true,
      itemSize: itemSize,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        key: starRatingKey(index),
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
