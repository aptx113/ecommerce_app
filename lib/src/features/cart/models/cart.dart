
import 'item.dart';
import '../../products/models/product.dart';

class Cart {
  const Cart([
    this.items = const {},
  ]);

  final Map<ProductID, int> items;
}

extension CartItems on Cart {
  List<Item> toItemsList() => items.entries
      .map((entry) => Item(productId: entry.key, quantity: entry.value))
      .toList();
}
