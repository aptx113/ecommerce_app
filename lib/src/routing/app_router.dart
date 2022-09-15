import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/data/fake_auth_repository.dart';
import '../features/authentication/ui/account/account_screen.dart';
import '../features/authentication/ui/sign_in/email_password_sign_in_screen.dart';
import '../features/authentication/ui/sign_in/email_password_sign_in_state.dart';
import '../features/cart/ui/shopping_cart/shopping_cart_screen.dart';
import '../features/checkout/checkout_screen.dart';
import '../features/orders/ui/orders_list_screen.dart';
import '../features/products/ui/product_screen/product_screen.dart';
import '../features/products/ui/products_list/products_list_screen.dart';
import '../features/reviews/ui/leave_review_screen/leave_review_screen.dart';
import 'not_found_screen.dart';

enum AppRoute {
  home('/'),
  product('/product'),
  leaveReview('/review'),
  cart('/cart'),
  checkout('/checkout'),
  orders('/orders'),
  account('/account'),
  signIn('/signIn');

  final String location;
  const AppRoute(this.location);
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (state) {
      final isLoggedIn = authRepository.currentUser != null;
      if (isLoggedIn) {
        if (state.location == AppRoute.signIn.location) {
          return AppRoute.home.location;
        }
      } else {
        if (state.location == AppRoute.account.location ||
            state.location == AppRoute.orders.location) {
          return AppRoute.home.location;
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const ProductsListScreen(),
        routes: [
          GoRoute(
            path: 'product/:id',
            name: AppRoute.product.name,
            builder: (context, state) {
              final productId = state.params['id']!;
              return ProductScreen(productId: productId);
            },
            routes: [
              GoRoute(
                path: 'review',
                name: AppRoute.leaveReview.name,
                pageBuilder: (context, state) {
                  final productId = state.params['id']!;
                  return MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: LeaveReviewScreen(productId: productId),
                  );
                },
              )
            ],
          ),
          GoRoute(
            path: 'cart',
            name: AppRoute.cart.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const ShoppingCartScreen(),
            ),
            routes: [
              GoRoute(
                path: 'checkout',
                name: AppRoute.checkout.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey(state.location),
                  fullscreenDialog: true,
                  child: const CheckoutScreen(),
                ),
              )
            ],
          ),
          GoRoute(
            path: 'orders',
            name: AppRoute.orders.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const OrdersListScreen(),
            ),
          ),
          GoRoute(
            path: 'account',
            name: AppRoute.account.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const AccountScreen(),
            ),
          ),
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const EmailPasswordSignInScreen(
                formType: EmailPasswordSignInFormType.signIn,
              ),
            ),
          )
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
