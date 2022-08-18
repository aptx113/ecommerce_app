import 'package:flutter/material.dart';

import '../../common_widgets/action_text_button.dart';
import '../../constants/breakpoints.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/app_user.dart';
import '../account/account_screen.dart';
import '../orders_list/orders_list_screen.dart';
import '../sign_in/email_password_sign_in_screen.dart';
import '../sign_in/email_password_sign_in_state.dart';
import 'more_menu_button.dart';
import 'shopping_cart_icon.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const user = AppUser(uid: '123', email: 'test@test.com');

    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text('My Shop'.hardcoded),
        actions: const [
          ShoppingCartIcon(),
          MoreMenuButton(
            user: user,
          )
        ],
      );
    } else {
      return AppBar(
        title: Text('My Shop'.hardcoded),
        actions: [
          const ShoppingCartIcon(),
          if (user != null) ...[
            ActionTextButton(
              key: MoreMenuButton.ordersKey,
              text: 'Order'.hardcoded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const OrdersListScreen(),
                ),
              ),
            ),
            ActionTextButton(
              key: MoreMenuButton.accountKey,
              text: 'Account'.hardcoded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const AccountScreen(),
                ),
              ),
            ),
          ] else
            ActionTextButton(
              key: MoreMenuButton.signInKey,
              text: 'Sign In'.hardcoded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const EmailPasswordSignInContents(
                    formType: EmailPasswordSignInFormType.signIn,
                  ),
                ),
              ),
            )
        ],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
