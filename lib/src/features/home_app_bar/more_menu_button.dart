import 'package:flutter/material.dart';

import '../../localization/string_hardcoded.dart';
import '../../models/app_user.dart';
import '../account/account_screen.dart';
import '../orders_list/orders_list_screen.dart';
import '../sign_in/email_password_sign_in_screen.dart';
import '../sign_in/email_password_sign_in_state.dart';

enum PopupMenuOption {
  signIn(key: 'menuSignIn'),
  orders(key: 'menuOrders'),
  account(key: 'menuAccount');

  final String key;
  const PopupMenuOption({required this.key});
}

class MoreMenuButton extends StatelessWidget {
  const MoreMenuButton({Key? key, this.user}) : super(key: key);
  final AppUser? user;

  static const signInKey = Key('menuSignIn');
  static const ordersKey = Key('menuOrders');
  static const accountKey = Key('menuAccount');

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) {
        return user != null
            ? <PopupMenuEntry<PopupMenuOption>>[
                PopupMenuItem(
                  key: ordersKey,
                  value: PopupMenuOption.orders,
                  child: Text('Orders'.hardcoded),
                ),
                PopupMenuItem(
                  key: accountKey,
                  value: PopupMenuOption.account,
                  child: Text('Account'.hardcoded),
                ),
              ]
            : <PopupMenuEntry<PopupMenuOption>>[
                PopupMenuItem(
                  key: signInKey,
                  value: PopupMenuOption.signIn,
                  child: Text('Sign In'.hardcoded),
                ),
              ];
      },
      onSelected: (option) {
        switch (option) {
          case PopupMenuOption.signIn:
            Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => const EmailPasswordSignInScreen(
                  formType: EmailPasswordSignInFormType.signIn,
                ),
              ),
            );
            break;
          case PopupMenuOption.orders:
            Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => const OrdersListScreen(),
              ),
            );
            break;
          case PopupMenuOption.account:
            Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => const AccountScreen(),
              ),
            );
            break;
        }
      },
    );
  }
}
