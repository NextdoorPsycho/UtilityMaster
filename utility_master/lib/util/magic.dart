import 'package:fast_log/fast_log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_io/io.dart';
// BuildContext ctx = router.routerDelegate.navigatorKey.currentContext!;

String get u {
  try {
    return FirebaseAuth.instance.currentUser!.uid;
  } catch (e, es) {
    error(es);
    return "No User";
  }
}

bool get isWindowManaged =>
    !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

BehaviorSubject<ThemeMode> themeMode = BehaviorSubject.seeded(ThemeMode.system);
BehaviorSubject<double> themeOpacity = BehaviorSubject.seeded(1.0);
