import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_log/fast_log.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:precision_stopwatch/precision_stopwatch.dart';
import 'package:serviced/serviced.dart';
import 'package:utility_master/data/crud/crud.dart';
import 'package:utility_master/data/user/capabilities.dart';
import 'package:utility_master/data/user/settings.dart';
import 'package:utility_master/data/user/user.dart';
import 'package:utility_master/util/magic.dart';

typedef ArcaneUserData = Map<String, dynamic>;

class UserService extends StatelessService {
  String? _grabFirstName;
  String? _grabLastName;
  late User lastUser;
  late UserCapabilities lastUserCapabilities;
  late UserSettings lastUserSettings;
  List<VoidCallback> closable = [];
  bool bound = false;

  Future<void> unbind() async {
    bound = false;
    for (var e in closable) {
      e();
    }
    closable.clear();
    _grabFirstName = null;
    _grabLastName = null;
  }

  void grabName(String? firstName, String? lastName) {
    _grabFirstName = firstName;
    _grabLastName = lastName;
  }

  Future<void> bind(String uid) async {
    if (bound) {
      await unbind();
    }

    bound = true;

    verbose("Binding user service for $uid");
    try {
      await FirebaseAnalytics.instance
          .setUserId(id: uid, callOptions: AnalyticsCallOptions(global: true));
      verbose("Bound Analytics");
    } catch (e) {
      warn("Analytics is not supported on this platform yet.");
    }

    try {
      PrecisionStopwatch p = PrecisionStopwatch.start();
      await Future.wait([
        _ensureUser(uid),
        _ensureUserCapabilities(uid),
        _ensureUserSettings(uid),
      ]);
      verbose("Got all init data in ${p.getMilliseconds()}");
      List<StreamSubscription> subs = [
        Crud.user().stream(uid).listen((event) => lastUser = event),
        Crud.userCapabilities(uid)
            .stream("capabilities")
            .listen((event) => lastUserCapabilities = event),
        Crud.userSettings(uid).stream("settings").listen((event) {
          lastUserSettings = event;
          themeMode.add(lastUserSettings.themeModeEnum);
          themeOpacity.add(lastUserSettings.appOpacity);
          windowEffect.add(lastUserSettings.windowEffectEnum);
          verbose("Got last user settings");
        }),
      ];
      closable.addAll(subs.map((e) => () => e.cancel()));
    } catch (e, es) {
      error(e);
      error(es);
    }
  }

  String uid() => auth.FirebaseAuth.instance.currentUser!.uid;

  Future<void> _ensureUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await Crud.user().collection.doc(uid).get();

    if (!snap.exists) {
      lastUser = User(
        firstName: _grabFirstName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .first,
        lastName: _grabLastName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .last,
        email: auth.FirebaseAuth.instance.currentUser!.email!,
      );
      await Crud.user().collection.doc(uid).set(lastUser.toMap());
    } else {
      lastUser = UserMapper.fromMap(snap.data()!);
    }
  }

  Future<void> _ensureUserCapabilities(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await Crud.userCapabilities(uid).collection.doc("capabilities").get();

    if (!snap.exists) {
      lastUserCapabilities = UserCapabilities(
        admin: false,
      );
      try {
        await Crud.userCapabilities(uid)
            .collection
            .doc("capabilities")
            .set(lastUserCapabilities.toMap());
      } catch (e) {}
    } else {
      lastUserCapabilities = UserCapabilitiesMapper.fromMap(snap.data()!);
    }
  }

  Future<void> _ensureUserSettings(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await Crud.userSettings(uid).collection.doc("settings").get();

    if (!snap.exists) {
      lastUserSettings = UserSettings(
        themeMode: ThemeMode.system.name,
      );
      await Crud.userSettings(uid)
          .collection
          .doc("settings")
          .set(lastUserSettings.toMap());
    } else {
      lastUserSettings = UserSettingsMapper.fromMap(snap.data()!);
    }
  }

  UserSettings settings() => lastUserSettings;
}
