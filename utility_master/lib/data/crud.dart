import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_crud/fire_crud.dart';
import 'package:flutter/material.dart';
import 'package:utility_master/data/user/user.dart';
import 'package:utility_master/data/user/user_settings.dart';

import 'user/user_capabilities.dart';

class Crud {
  static FireCrudEvent usage = FireCrudEvent();

  static FireCrud<UserCapabilities> userCapabilities(String uid) => FireCrud<UserCapabilities>(
      usageTracker: (event) => usage += event,
      collection: FirebaseFirestore.instance.collection("user/$uid/data"),
      toMap: (t) => t.toMap(),
      emptyObject: UserCapabilities(admin: false)..exists = false,
      fromMap: (id, map) => UserCapabilitiesMapper.fromMap(map)
        ..uid = id
        ..exists ??= true);

  static FireCrud<UserSettings> userSettings(String uid) => FireCrud<UserSettings>(
      usageTracker: (event) => usage += event,
      collection: FirebaseFirestore.instance.collection("user/$uid/data"),
      toMap: (t) => t.toMap(),
      emptyObject: UserSettings(
        themeMode: ThemeMode.system.name,
      )..exists = false,
      fromMap: (id, map) => UserSettingsMapper.fromMap(map)
        ..uid = id
        ..exists ??= true);

  static FireCrud<User> user() => FireCrud<User>(
      usageTracker: (event) => usage += event,
      collection: FirebaseFirestore.instance.collection("user"),
      toMap: (t) => t.toMap(),
      emptyObject: User(
        email: "",
        firstName: "",
        lastName: "",
      )..exists = false,
      fromMap: (id, map) => UserMapper.fromMap(map)
        ..uid = id
        ..exists ??= true);
}
