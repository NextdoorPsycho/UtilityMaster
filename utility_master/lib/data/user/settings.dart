import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_acrylic/window_effect.dart';

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

  WindowEffect get windowEffectEnum {
    switch (windowEffect) {
      case "transparent":
        return WindowEffect.transparent;
      case "disabled":
        return WindowEffect.disabled;
      case "solid":
        return WindowEffect.solid;
      case "aero":
        return WindowEffect.aero;
      case "acrylic":
        return WindowEffect.acrylic;
      case "mica":
        return WindowEffect.mica;
      default:
        return WindowEffect.solid;
    }
  }

  double get appOpacityRounded {
    return (themeOpacity * 100).round() / 100;
  }

  void setThemeMode(ThemeMode mode) {
    themeMode = mode.name;
  }

  void setWindowEffect(WindowEffect effect) {
    windowEffect = effect.name;
  }

  void setAppOpacity(double opacity) {
    themeOpacity = opacity;
  }
}
