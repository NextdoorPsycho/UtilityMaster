import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
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
            _SignOutManager.signOut(context);
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

class _SignOutManager {
  static void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Forcibly reload the app or clear navigation stack
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
