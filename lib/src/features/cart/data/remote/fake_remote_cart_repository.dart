import 'package:ecommerce_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/models/cart.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';

import '../../../../utils/delay.dart';

class FakeRemoteCartRepository implements RemoteCartRepository {
  FakeRemoteCartRepository({this.addDelay = true});
  final bool addDelay;

  final _carts = InMemoryStore<Map<String, Cart>>({});

  @override
  Future<Cart> fetchCart(String uid) {
    return Future.value(_carts.value[uid] ?? const Cart());
  }

  @override
  Stream<Cart> watchCart(String uid) {
    return _carts.stream.map((cartData) => cartData[uid] ?? const Cart());
  }

  @override
  Future<void> setCart(String uid, Cart cart) async {
    await delay(addDelay);
    final carts = _carts.value;
    carts[uid] = cart;
    _carts.value = carts;
  }
}
