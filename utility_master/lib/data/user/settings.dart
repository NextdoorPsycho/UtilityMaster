import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'settings.mapper.dart';

@MappableClass()
class UserSettings with UserSettingsMappable {
  String themeMode;
  String? uid;
  bool? exists;

  UserSettings({
    this.themeMode = "dark",
  });

  void toggleTheme() {
    themeMode = themeMode == "dark" ? "light" : "dark";
  }

  ThemeMode get themeModeEnum {
    switch (themeMode) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
