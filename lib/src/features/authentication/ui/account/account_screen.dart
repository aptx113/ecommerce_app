import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/action_text_button.dart';
import '../../../../common_widgets/alert_dialogs.dart';
import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../localization/app_localizations_context.dart';
import '../../../../utils/async_value_ui.dart';
import '../../data/fake_auth_repository.dart';
import 'account_screen_controller.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      accountScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(accountScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: state.isLoading
            ? const CircularProgressIndicator()
            : Text(context.loc!.account),
        actions: [
          ActionTextButton(
            text: context.loc!.logout,
            onPressed: state.isLoading
                ? null
                : () async {
                    final logout = await showAlertDialog(
                      context: context,
                      title: AppLocalizations.of(context)!.areYouSure,
                      cancelActionText: AppLocalizations.of(context)!.cancel,
                      defaultActionText: AppLocalizations.of(context)!.logout,
                    );
                    if (logout == true) {
                      ref
                          .read(accountScreenControllerProvider.notifier)
                          .signOut();
                    }
                  },
          )
        ],
      ),
      body: const ResponsiveCenter(
          padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: UserDataTable()),
    );
  }
}

class UserDataTable extends ConsumerWidget {
  const UserDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme.subtitle2!;
    final user = ref.watch(authStateChangesProvider).value;
    return DataTable(columns: [
      DataColumn(
        label: Text(
          context.loc!.field,
          style: style,
        ),
      ),
      DataColumn(
        label: Text(
          context.loc!.value,
          style: style,
        ),
      )
    ], rows: [
      _makeDataRow(
        context.loc!.uidLowercase,
        user?.uid ?? '',
        style,
      ),
      _makeDataRow(
        context.loc!.emailLowercase,
        user?.email ?? '',
        style,
      )
    ]);
  }

  DataRow _makeDataRow(String name, String value, TextStyle style) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            name,
            style: style,
          ),
        ),
        DataCell(
          Text(
            value,
            style: style,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
