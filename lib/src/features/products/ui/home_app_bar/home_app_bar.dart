import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/action_text_button.dart';
import '../../../../constants/breakpoints.dart';
import '../../../../routing/app_router.dart';
import '../../../authentication/data/fake_auth_repository.dart';
import 'more_menu_button.dart';
import 'shopping_cart_icon.dart';

class HomeAppBar extends ConsumerWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text(AppLocalizations.of(context)!.appBarTitle),
        actions: [
          const ShoppingCartIcon(),
          MoreMenuButton(
            user: user,
          )
        ],
      );
    } else {
      return AppBar(
        title: Text(AppLocalizations.of(context)!.appBarTitle),
        actions: [
          const ShoppingCartIcon(),
          if (user != null) ...[
            ActionTextButton(
              key: MoreMenuButton.ordersKey,
              text: AppLocalizations.of(context)!.orders,
              onPressed: () => context.pushNamed(AppRoute.orders.name),
            ),
            ActionTextButton(
              key: MoreMenuButton.accountKey,
              text: AppLocalizations.of(context)!.account,
              onPressed: () => context.pushNamed(AppRoute.account.name),
            ),
          ] else
            ActionTextButton(
              key: MoreMenuButton.signInKey,
              text: AppLocalizations.of(context)!.signIn,
              onPressed: () => context.pushNamed(AppRoute.signIn.name),
            )
        ],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
