import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/test_products.dart';
import '../models/product.dart';

class FakeProductsRepository {
  final _products = testProducts;

  List<Product> get getProductsList => _products;

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield _products;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}

final productsRepositoryProvider = Provider<FakeProductsRepository>((ref) {
  return FakeProductsRepository();
});

final productsListStreamProvider =
    StreamProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProductsList();
});

final productsListFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
});

final productStreamProvider =
    StreamProvider.autoDispose.family<Product?, String>(
  (ref, id) {
    final productsRepository = ref.watch(productsRepositoryProvider);
    return productsRepository.watchProduct(id);
  },
  disposeDelay: const Duration(seconds: 10),
  cacheTime: const Duration(seconds: 10),
);
