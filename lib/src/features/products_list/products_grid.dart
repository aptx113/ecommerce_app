import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../constants/app_sizes.dart';
import '../../constants/test_products.dart';
import '../../localization/string_hardcoded.dart';
import '../product_page/product_screen.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const products = testProducts;
    return products.isEmpty
        ? Center(
            child: Text(
              'No products found'.hardcoded,
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        : ProductsLayoutGrid(
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProductScreen(productId: product.id),
                  ),
                ),
              );
            });
  }
}

class ProductsLayoutGrid extends StatelessWidget {
  const ProductsLayoutGrid({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final crossAxisCount = max(1, width ~/ 250);

      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (itemCount / crossAxisCount).ceil();

      final rowSizes = List.generate(numRows, (_) => auto);

      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: Sizes.p24,
        columnGap: Sizes.p24,
        children: [
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
