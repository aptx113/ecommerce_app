import 'package:flutter/material.dart';

import '../../common_widgets/action_text_button.dart';
import '../../common_widgets/alert_dialogs.dart';
import '../../common_widgets/responsive_center.dart';
import '../../constants/app_sizes.dart';
import '../../localization/string_hardcoded.dart';
import '../../models/app_user.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'.hardcoded),
        actions: [
          ActionTextButton(
            text: 'Logout'.hardcoded,
            onPressed: () async {
              showNotImplementedAlertDialog(context: context);
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
          'Field'.hardcoded,
          style: style,
        ),
      ),
      DataColumn(
        label: Text(
          'Value'.hardcoded,
          style: style,
        ),
      )
    ], rows: [
      _makeDataRow(
        'uid'.hardcoded,
        user.uid,
        style,
      ),
      _makeDataRow(
        'email'.hardcoded,
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
