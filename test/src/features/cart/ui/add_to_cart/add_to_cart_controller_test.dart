import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/models/item.dart';
import 'package:ecommerce_app/src/features/cart/ui/add_to_cart/add_to_cart_controller.dart';

import '../../../../mocks.dart';

void main() {
  const productId = '1';
  late CartService cartService;
  late AddToCartController controller;

  setUp(() {
    cartService = MockCartService();
    controller = AddToCartController(cartService: cartService);
  });
  group('addItem', () {
    test('item added with quantity = 2, success', () async {
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      when(() => cartService.addItem(item)).thenAnswer(
        (_) => Future.value(),
      );
      expect(
        controller.debugState,
        const AsyncData(1),
      );
      controller.updateQuantity(quantity);
      expect(
        controller.debugState,
        const AsyncData(2),
      );

      await controller.addItem(productId);
      verify(() => cartService.addItem(item)).called(1);
      expect(
        controller.debugState,
        const AsyncData(1),
      );
    });
    test('item addedd with quantity = 2, failure', () async {
      const quantity = 2;
      const item = Item(productId: productId, quantity: quantity);
      when(() => cartService.addItem(item))
          .thenThrow((_) => Exception('Connection failed'));
      expect(
        controller.debugState,
        const AsyncData(1),
      );
      controller.updateQuantity(quantity);
      expect(
        controller.debugState,
        const AsyncData(2),
      );

      await controller.addItem(productId);
      verify(() => cartService.addItem(item)).called(1);
      expect(
        controller.debugState,
        predicate<AsyncValue<int>>(
          (value) {
            expect(value.hasError, true);
            return true;
          },
        ),
      );
    });
  });
}
