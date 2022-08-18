// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common_widgets/custom_image.dart';
import '../../common_widgets/responsive_center.dart';
import '../../common_widgets/responsive_two_column_layout.dart';
import '../../constants/app_sizes.dart';
import '../../constants/test_products.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/product.dart';
import '../../utils/currency_formatter.dart';
import '../home_app_bar/home_app_bar.dart';
import '../not_found/empty_placeholder_widget.dart';
import 'add_to_cart/add_to_cart_widget.dart';
import 'leave_review_action.dart';
import 'product_average_rating.dart';
import 'product_reviews/product_reviews_list.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    final product = testProducts.firstWhere(
      (product) => product.id == productId,
    );
    return Scaffold(
      appBar: const HomeAppBar(),
      body: product == null
          ? EmptyPlaceholderWidget(
              message: 'Product not found'.hardcoded,
            )
          : CustomScrollView(
              slivers: [
                ResponsiveSliverCenter(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: ProductDetails(
                    product: product,
                  ),
                ),
                ProductReviewsList(
                  productId: productId,
                )
              ],
            ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final priceFormatted = currencyFormatter.format(product.price);
    return ResponsiveTwoColumnLayout(
      startContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: CustomImage(imageUrl: product.imageUrl),
        ),
      ),
      spacing: Sizes.p16,
      endContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              gapH8,
              Text(product.description),
              if (product.numRatings >= 1) ...[
                gapH8,
                ProductAverageRating(product: product),
              ],
              gapH8,
              const Divider(),
              gapH8,
              Text(
                priceFormatted,
                style: Theme.of(context).textTheme.headline5,
              ),
              gapH8,
              LeaveReviewAction(productId: product.id),
              const Divider(),
              gapH8,
              AddToCartWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
