import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../products/models/product.dart';
import 'item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const Cart._();
  const factory Cart([@Default({}) Map<ProductID, int> items]) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  factory Cart.fromJsonString(String source) =>
      Cart.fromJson(json.decode(source));

  String toJsonString() {
    return json.encode(toJson());
  }
}

extension CartItems on Cart {
  List<Item> toItemsList() => items.entries
      .map((entry) => Item(productId: entry.key, quantity: entry.value))
      .toList();
}
