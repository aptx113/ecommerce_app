import 'package:ecommerce_app/src/features/cart/models/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_remote_cart_repository.dart';

abstract class RemoteCartRepository {
  Future<Cart> fetchCart(String uid);

  Stream<Cart> watchCart(String uid);

  Future<void> setCart(String uid, Cart cart);
}

final remoteCartRepositoryProvider = Provider<RemoteCartRepository>((ref) {
  // TODO: replace with "real" remote cart repository
  return FakeRemoteCartRepository();
});
