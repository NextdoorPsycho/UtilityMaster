import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_log/fast_log.dart';
import 'package:flutter/material.dart';

part 'settings.mapper.dart';

@MappableClass()
class UserSettings with UserSettingsMappable {
  String themeMode;
  String windowEffect;
  double themeOpacity;
  String? uid;
  bool? exists;

  UserSettings({
    this.themeMode = "dark", // "dark", "light", "system"
    this.windowEffect =
        "solid", // "transparent", "disabled", "solid", "aero", "acrylic", "mica"
    this.themeOpacity = 1.0,
  });

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

  double get appOpacityRounded {
    return (themeOpacity * 100).round() / 100;
  }

  void setThemeMode(ThemeMode mode) {
    info("Setting Theme Mode: ${mode.name}");
    themeMode = mode.name;
  }

  void toggleTheme() {
    info("Toggling Theme Mode to ${themeMode == "dark" ? "light" : "dark"}");
    themeMode = themeMode == "dark" ? "light" : "dark";
  }

  void setAppOpacity(double opacity) {
    info("Setting App Opacity: $opacity");
    themeOpacity = opacity;
  }
}
