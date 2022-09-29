import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FakeProductsRepository makeProductsRepository() =>
      FakeProductsRepository(addDelay: false);
  group('FakeProductsRepsository', () {
    test('getProductsList returns global list', () {
      final productsRepository = makeProductsRepository();
      expect(productsRepository.getProductsList, testProducts);
    });

    test('getProduct(1) returns first item', () {
      final productsRepository = FakeProductsRepository();
      expect(productsRepository.getProduct('1'), testProducts[0]);
    });

    test('getProduct(100) returns null', () {
      final productsRepository = FakeProductsRepository();
      expect(productsRepository.getProduct('100'), null);
    });
  });

  test('fetchProdcutsList returns global list', () async {
    final productsRepository = FakeProductsRepository();
    expect(await productsRepository.fetchProductsList(), testProducts);
  });

  test('watchProductsList emits global list', () {
    final productsRepository = FakeProductsRepository();
    expect(productsRepository.watchProductsList(), emits(testProducts));
  });

  test('watchProduct(1) emits first item', () {
    final productsRepository = FakeProductsRepository();
    expect(productsRepository.watchProduct('1'), emits(testProducts[0]));
  });

  test('watchProduct(100) emits null', () {
    final productsRepository = FakeProductsRepository();
    expect(productsRepository.watchProduct('100'), emits(null));
  });
}
