import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:utility_master/data/crud.dart';
import 'package:utility_master/main.dart';

class UMB {
  static Widget themeToggle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton(
          onPressed: () {
            Crud.user().txn(u, (data) => data..toggleTheme());
          },
          icon: Text(
            'Toggle Theme',
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
      ],
    );
  }
}
