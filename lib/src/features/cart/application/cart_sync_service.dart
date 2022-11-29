import 'dart:math';

import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/models/app_user.dart';
import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/models/cart.dart';
import 'package:ecommerce_app/src/features/cart/models/item.dart';
import 'package:ecommerce_app/src/features/cart/models/mutable_cart.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartSyncService {
  CartSyncService(this.ref) {
    _init();
  }
  final Ref ref;

  void _init() {
    ref.listen<AsyncValue<AppUser?>>(authStateChangesProvider,
        (previous, next) {
      final previousUser = previous?.value;
      final currentUser = next.value;
      if (previousUser == null && currentUser != null) {
        _moveItemsToRemoteCart(currentUser.uid);
      }
    });
  }

  Future<void> _moveItemsToRemoteCart(String uid) async {
    try {
      final localRepo = ref.read(localCartRepositoryProvider);
      final localCart = await localRepo.fetchCart();
      if (localCart.items.isNotEmpty) {
        final remoteRepo = ref.read(remoteCartRepositoryProvider);
        final remoteCart = await remoteRepo.fetchCart(uid);
        final localItemsToAdd =
            await _getLocalItemsToAdd(localCart, remoteCart);
        final updatedCart = remoteCart.addItems(localItemsToAdd);

        await remoteRepo.setCart(uid, updatedCart);
        await localRepo.setCart(const Cart());
      }
    } catch (e) {
      // TODO: Handle error and/or rethrow
    }
  }

  Future<List<Item>> _getLocalItemsToAdd(
      Cart localCart, Cart remoteCart) async {
    final productsRepo = ref.read(productsRepositoryProvider);
    final products = await productsRepo.fetchProductsList();
    final localItemsToAdd = <Item>[];
    for (final localItem in localCart.items.entries) {
      final productId = localItem.key;
      final localQuantity = localItem.value;

      final remoteQuantity = remoteCart.items[productId] ?? 0;
      final product = products.firstWhere((product) => product.id == productId);
      final cappedLocalQuantity =
          min(localQuantity, product.availableQuantity - remoteQuantity);
      if (cappedLocalQuantity > 0) {
        localItemsToAdd
            .add(Item(productId: productId, quantity: cappedLocalQuantity));
      }
    }
    return localItemsToAdd;
  }
}

final cartSyncServiceProvider = Provider<CartSyncService>((ref) {
  return CartSyncService(ref);
});
