import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common_widgets/action_text_button.dart';
import '../../../../common_widgets/alert_dialogs.dart';
import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../localization/app_localizations_of.dart';
import '../../models/app_user.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations!.account),
        actions: [
          ActionTextButton(
            text: context.localizations!.logout,
            onPressed: () async {
              final logout = await showAlertDialog(
                  context: context,
                  title: AppLocalizations.of(context)!.areYouSure,
                  cancelActionText: AppLocalizations.of(context)!.cancel,
                  defaultActionText: AppLocalizations.of(context)!.logout);
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

class UserDataTable extends StatelessWidget {
  const UserDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.subtitle2!;
    const user = AppUser(uid: '123', email: 'test@test.com');
    return DataTable(columns: [
      DataColumn(
        label: Text(
          context.localizations!.field,
          style: style,
        ),
      ),
      DataColumn(
        label: Text(
          context.localizations!.value,
          style: style,
        ),
      )
    ], rows: [
      _makeDataRow(
        context.localizations!.uidLowercase,
        user.uid,
        style,
      ),
      _makeDataRow(
        context.localizations!.emailLowercase,
        user.email ?? '',
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
