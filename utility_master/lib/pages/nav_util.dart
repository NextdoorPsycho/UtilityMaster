import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';

class Nav {
  static void goToLogin(BuildContext context) {
    verbose('Login');
    Navigator.of(context).pushReplacementNamed('/login');
  }

  static void goToHome(BuildContext context) {
    verbose('Home');
    Navigator.of(context).pushReplacementNamed('/home');
  }

  static void goToAdmin(BuildContext context) {
    verbose('Settings');
    Navigator.of(context).pushReplacementNamed('/settings');
  }
}
