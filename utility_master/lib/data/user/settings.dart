import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_acrylic/window_effect.dart';

part 'settings.mapper.dart';

@MappableClass()
class UserSettings with UserSettingsMappable {
  String themeMode;
  WindowEffect windowEffect;
  double appOpacity;
  String? uid;
  bool? exists;

  UserSettings({
    this.themeMode = "dark", // "dark", "light", "system"
    this.windowEffect = WindowEffect
        .solid, // "transparent", "disabled", "solid", "aero", "acrylic", "mica"
    this.appOpacity = 1.0,
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

  void setThemeMode(ThemeMode mode) {
    themeMode = mode.name;
  }

  void setWindowEffect(WindowEffect effect) {
    windowEffect = effect;
  }

  void setAppOpacity(double opacity) {
    appOpacity = opacity;
  }
}
