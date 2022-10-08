// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class ItemQuantitySelector extends StatelessWidget {
  const ItemQuantitySelector({
    super.key,
    required this.quantity,
    required this.maxQuantity,
    this.itemIndex,
    this.onChanged,
  });
  final int quantity;
  final int maxQuantity;
  final int? itemIndex;
  final ValueChanged<int>? onChanged;

  static Key decrementKey([int? index]) =>
      index != null ? Key('decrement-$index') : const Key('decrement');
  static Key quantityKey([int? index]) =>
      index != null ? Key('quantity-$index') : const Key('quantity');
  static Key incrementKey([int? index]) =>
      index != null ? Key('increment-$index') : const Key('increment');

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.p24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            key: decrementKey(itemIndex),
            onPressed: onChanged != null && quantity > 1
                ? () => onChanged?.call(quantity - 1)
                : null,
            icon: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 30.0,
            child: Text(
              '$quantity',
              key: quantityKey(itemIndex),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          IconButton(
            key: incrementKey(itemIndex),
            onPressed: onChanged != null && quantity < maxQuantity
                ? () => onChanged?.call(quantity + 1)
                : null,
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
