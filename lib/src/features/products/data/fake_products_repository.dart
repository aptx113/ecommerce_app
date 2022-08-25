import '../../../constants/test_products.dart';
import '../models/product.dart';

class FakeProductsRepository {
  FakeProductsRepository._();
  static FakeProductsRepository instance = FakeProductsRepository._();
  final _products = testProducts;

  List<Product> get getProductsList => _products;

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() {
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() => Stream.value(_products);

  Stream<Product?> watchProduct(String id) {
    return watchProductsList()
        .map((products) => products.firstWhere((product) => product.id == id));
  }
}
