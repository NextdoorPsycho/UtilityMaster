import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UMB {
  static Widget themeToggle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShadButton(
          onPressed: () {
            info("Toggled Theme");
            // Crud.userSettings(u).txn("settings", (s) => s..toggleTheme());

            // Crud.userSettings(u).update("settings", {
            //   "themeMode":
            //       (svc<UserService>().lastUserSettings..toggleTheme()).themeMode
            // });

            // Crud.userSettings(u).set(
            //     "settings", svc<UserService>().lastUserSettings..toggleTheme());
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
