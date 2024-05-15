import 'package:flutter/material.dart';
import 'package:serviced/serviced.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/data/crud/crud.dart';
import 'package:utility_master/main.dart';
import 'package:utility_master/util/svc/login.dart';

class UMB {
  static Widget themeToggle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton(
          onPressed: () {
            Crud.userSettings(u).txn("settings", (s) => s..toggleTheme());
          },
          icon: Text(
            'Toggle Theme',
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
      ],
    );
  }

  static Widget signOut(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton.destructive(
          onPressed: () {
            svc<LoginService>().signOutDialog(context);
          },
          icon: Text(
            'Sign Out',
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
      ],
    );
  }
}
