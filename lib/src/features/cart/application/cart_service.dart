// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/data/fake_auth_repository.dart';
import '../../products/models/product.dart';
import '../data/local/local_cart_repository.dart';
import '../data/remote/remote_cart_repository.dart';
import '../models/cart.dart';
import '../models/item.dart';
import '../models/mutable_cart.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  Future<Cart> _fetchCart() {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      return ref.read(remoteCartRepositoryProvider).fetchCart(user.uid);
    } else {
      return ref.read(localCartRepositoryProvider).fetchCart();
    }
  }

  Future<void> _setCart(Cart cart) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      await ref.read(remoteCartRepositoryProvider).setCart(user.uid, cart);
    } else {
      await ref.read(localCartRepositoryProvider).setCart(cart);
    }
  }

  Future<void> setItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
  }

  Future<void> addItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.addItem(item);
    await _setCart(updated);
  }

  Future<void> removeItembyId(ProductID productId) async {
    final cart = await _fetchCart();
    final updated = cart.removeItemById(productId);
    await _setCart(updated);
  }
}

@riverpod
CartService cartService(CartServiceRef ref) {
  return CartService(ref);
}

final cartStreamProvider = StreamProvider<Cart>((ref) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref.watch(remoteCartRepositoryProvider).watchCart(user.uid);
  } else {
    return ref.watch(localCartRepositoryProvider).watchCart();
  }
});
