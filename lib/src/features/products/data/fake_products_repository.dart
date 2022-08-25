import '../../../constants/test_products.dart';
import '../models/product.dart';

class FakeProductsRepository {
  FakeProductsRepository._();
  static FakeProductsRepository instance = FakeProductsRepository._();
  List<Product> get getProductsList => testProducts;
  
  Product? getProduct(String id) {
    return testProducts.firstWhere((product) => product.id == id);
  }
}
