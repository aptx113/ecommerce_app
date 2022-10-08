import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../routing/app_router.dart';
import '../../data/fake_products_repository.dart';
import '../../models/product.dart';
import 'product_card.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsListValue = ref.watch(productsListStreamProvider);
    return AsyncValueWidget<List<Product>>(
      value: productsListValue,
      data: (products) => products.isEmpty
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.noProductsFound,
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          : ProductsLayoutGrid(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onPressed: () => context.goNamed(
                    AppRoute.product.name,
                    params: {'id': product.id},
                  ),
                );
              },
            ),
    );
  }
}

class ProductsLayoutGrid extends StatelessWidget {
  const ProductsLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

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
