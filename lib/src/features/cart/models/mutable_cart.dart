import 'cart.dart';
import 'item.dart';
import '../../products/models/product.dart';

extension MutableCart on Cart {
  Cart setItem(Item item) {
    final copy = Map<ProductID, int>.from(items);
    copy[item.productId] = item.quantity;
    return Cart(copy);
  }

  Cart addItem(Item item) {
    final copy = Map<ProductID, int>.from(items);
    copy.update(
      item.productId,
      (value) => item.quantity + value,
      ifAbsent: () => item.quantity,
    );
    return Cart(copy);
  }

  Cart addItems(List<Item> itemsToAdd) {
    final copy = Map<ProductID, int>.from(items);
    for (var item in itemsToAdd) {
      copy.update(
        item.productId,
        (value) => item.quantity + value,
        ifAbsent: () => item.quantity,
      );
    }
    return Cart(copy);
  }

  Cart removeItemById(ProductID productId) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productId);
    return Cart(copy);
  }

  Cart clear() {
    return const Cart();
  }
}
