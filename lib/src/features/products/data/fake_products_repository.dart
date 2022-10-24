import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/test_products.dart';
import '../models/product.dart';

part 'fake_products_repository.g.dart';

class FakeProductsRepository {
  FakeProductsRepository({this.addDelay = true});
  final bool addDelay;
  final _products = testProducts;

  List<Product> get getProductsList => _products;

  Product? getProduct(String id) {
    return _getProduct(_products, id);
  }

  Future<List<Product>> fetchProductsList() async {
    await delay(addDelay);
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() async* {
    await delay(addDelay);
    yield _products;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList().map((products) => _getProduct(products, id));
  }

  static Product? _getProduct(List<Product> products, String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}

@riverpod
FakeProductsRepository productsRepository(ProductsRepositoryRef ref) =>
    FakeProductsRepository(addDelay: false);

final productsListStreamProvider =
    StreamProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProductsList();
});

final productStreamProvider =
    StreamProvider.autoDispose.family<Product?, String>((ref, id) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProduct(id);
});
